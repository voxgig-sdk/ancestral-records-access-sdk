# AncestralRecordsAccess SDK context

require_relative '../utility/struct/voxgig_struct'
require_relative 'control'
require_relative 'operation'
require_relative 'spec'
require_relative 'result'
require_relative 'response'
require_relative 'error'
require_relative 'helpers'

class AncestralRecordsAccessContext
  # Every context of a client shares its root's operation cache. CRuby's GVL
  # makes each Hash operation atomic; a Ruby without one needs this lock.
  OPMAP_LOCK = Mutex.new

  attr_accessor :id, :out, :client, :utility, :ctrl, :meta, :config,
                :entopts, :options, :entity, :shared, :opmap,
                :data, :reqdata, :match, :reqmatch, :point,
                :spec, :result, :response, :op, :unexpected_fired

  def initialize(ctxmap = {}, basectx = nil)
    ctxmap ||= {}
    @id = "C#{rand(10000000..99999999)}"
    @out = {}
    # Set by make_error as it fires PreUnexpected, which fires once per
    # operation.
    @unexpected_fired = false

    @client = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "client") || basectx&.client
    @utility = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "utility") || basectx&.utility

    @ctrl = AncestralRecordsAccessControl.new
    ctrl_raw = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "ctrl")
    if ctrl_raw.is_a?(Hash)
      @ctrl.throw_err = ctrl_raw["throw"] if ctrl_raw.key?("throw")
      @ctrl.explain = ctrl_raw["explain"] if ctrl_raw["explain"].is_a?(Hash)
      @ctrl.actor = ctrl_raw["actor"] if ctrl_raw.key?("actor")
      @ctrl.paging = ctrl_raw["paging"] if ctrl_raw["paging"].is_a?(Hash)
    elsif basectx&.ctrl && AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "opname").nil?
      @ctrl = basectx.ctrl
    end

    m = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "meta")
    @meta = m.is_a?(Hash) ? m : (basectx&.meta || {})

    cfg = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "config")
    @config = cfg.is_a?(Hash) ? cfg : basectx&.config

    eo = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "entopts")
    @entopts = eo.is_a?(Hash) ? eo : basectx&.entopts

    o = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "options")
    @options = o.is_a?(Hash) ? o : basectx&.options

    e = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "entity")
    @entity = e || basectx&.entity

    s = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "shared")
    @shared = s.is_a?(Hash) ? s : basectx&.shared

    om = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "opmap")
    @opmap = om.is_a?(Hash) ? om : (basectx&.opmap || {})

    @data = AncestralRecordsAccessHelpers.to_map(AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "data")) || {}
    @reqdata = AncestralRecordsAccessHelpers.to_map(AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "reqdata")) || {}
    @match = AncestralRecordsAccessHelpers.to_map(AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "match")) || {}
    @reqmatch = AncestralRecordsAccessHelpers.to_map(AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "reqmatch")) || {}

    pt = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "point")
    @point = pt.is_a?(Hash) ? pt : basectx&.point

    sp = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "spec")
    @spec = sp.is_a?(AncestralRecordsAccessSpec) ? sp : basectx&.spec

    r = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "result")
    @result = r.is_a?(AncestralRecordsAccessResult) ? r : basectx&.result

    rp = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "response")
    @response = rp.is_a?(AncestralRecordsAccessResponse) ? rp : basectx&.response

    opname = AncestralRecordsAccessHelpers.get_ctx_prop(ctxmap, "opname") || ""
    @op = resolve_op(opname)
  end

  def resolve_op(opname)
    # Cache key is `<entity>:<opname>` so two entities with the same op
    # (e.g. both have a "list") get distinct cached Operations. Keying
    # on opname alone caused the first-resolved entity's points to be
    # served to every subsequent entity's call.
    entname = @entity&.respond_to?(:get_name) ? @entity.get_name : "_"
    cache_key = "#{entname}:#{opname}"
    cached = OPMAP_LOCK.synchronize { @opmap[cache_key] }
    return cached if cached
    return AncestralRecordsAccessOperation.new({}) if opname.empty?

    opcfg = VoxgigStruct.getpath(@config, "entity.#{entname}.op.#{opname}")

    input = (opname == "update" || opname == "create" || opname == "patch") ? "data" : "match"

    points = []
    if opcfg.is_a?(Hash)
      t = VoxgigStruct.getprop(opcfg, "points")
      points = t if t.is_a?(Array)
    end

    op = AncestralRecordsAccessOperation.new({
      "entity" => entname,
      "name" => opname,
      "input" => input,
      "points" => points,
    })
    # Racing requests get the Operation stored first.
    OPMAP_LOCK.synchronize { @opmap[cache_key] ||= op }
  end

  def make_error(code, msg)
    AncestralRecordsAccessError.new(code, msg, self)
  end

  # The serialised context leaves the pipeline (a logger, an error dump), so
  # it is cleaned; the live fields stay raw for the pipeline's own use.
  def to_h
    record = {
      "id" => @id,
      "op" => @op,
      "spec" => @spec,
      "entity" => @entity,
      "result" => @result,
      "response" => @response,
      "meta" => @meta,
    }
    clean = @utility.respond_to?(:clean) ? @utility.clean : nil
    clean.respond_to?(:call) ? clean.call(self, record) : record
  end

  def to_json(*args)
    to_h.to_json(*args)
  end

  def to_s
    "Context " + VoxgigStruct.jsonify(to_h)
  end

  def inspect
    to_s
  end
end
