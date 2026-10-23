# AncestralRecordsAccess SDK utility: prepare_body
require_relative 'media'
module AncestralRecordsAccessUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return AncestralRecordsAccessUtilities.raw_body(ctx.reqdata) if AncestralRecordsAccessUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
