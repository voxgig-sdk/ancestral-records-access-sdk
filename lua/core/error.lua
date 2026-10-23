-- AncestralRecordsAccess SDK error

local json = require("dkjson")

local AncestralRecordsAccessError = {}
AncestralRecordsAccessError.__index = AncestralRecordsAccessError

-- Reachable for a debugger, absent from the table itself: the context holds
-- the live spec and options, and an error is what gets dumped or encoded.
local CONTEXT = setmetatable({}, { __mode = "k" })


function AncestralRecordsAccessError.new(code, msg, ctx)
  local self = setmetatable({}, AncestralRecordsAccessError)
  self.is_sdk_error = true
  self.sdk = "AncestralRecordsAccess"
  self.code = code or ""
  self.msg = msg or ""
  self.result = nil
  self.spec = nil
  self.status = -1
  CONTEXT[self] = ctx
  return self
end


function AncestralRecordsAccessError:context()
  return CONTEXT[self]
end


function AncestralRecordsAccessError:error()
  return self.msg
end


function AncestralRecordsAccessError:not_found()
  return 404 == self.status
end


-- What make_error attached is already cleaned; the context is not part of
-- the record.
function AncestralRecordsAccessError:to_table()
  return {
    sdk = self.sdk,
    code = self.code,
    msg = self.msg,
    status = self.status,
    result = self.result,
    spec = self.spec,
  }
end


function AncestralRecordsAccessError:to_json()
  return json.encode(self:to_table())
end


function AncestralRecordsAccessError:__tostring()
  return self.msg
end


function AncestralRecordsAccessError.__tojson(self)
  return self:to_json()
end


return AncestralRecordsAccessError
