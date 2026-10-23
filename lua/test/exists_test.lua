-- AncestralRecordsAccess SDK exists test

local sdk = require("ancestral-records-access_sdk")

describe("AncestralRecordsAccessSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
