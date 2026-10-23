# AncestralRecordsAccess SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module AncestralRecordsAccessFeatures
  def self.make_feature(name)
    case name
    when "base"
      AncestralRecordsAccessBaseFeature.new
    when "ratelimit"
      AncestralRecordsAccessRatelimitFeature.new
    when "retry"
      AncestralRecordsAccessRetryFeature.new
    when "test"
      AncestralRecordsAccessTestFeature.new
    when "timeout"
      AncestralRecordsAccessTimeoutFeature.new
    else
      AncestralRecordsAccessBaseFeature.new
    end
  end
end
