# AncestralRecordsAccess SDK exists test

require "minitest/autorun"
require_relative "../AncestralRecordsAccess_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = AncestralRecordsAccessSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
