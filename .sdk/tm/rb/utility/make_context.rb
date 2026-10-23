# AncestralRecordsAccess SDK utility: make_context
require_relative '../core/context'
module AncestralRecordsAccessUtilities
  MakeContext = ->(ctxmap, basectx) {
    AncestralRecordsAccessContext.new(ctxmap, basectx)
  }
end
