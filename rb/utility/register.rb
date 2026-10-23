# AncestralRecordsAccess SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

AncestralRecordsAccessUtility.registrar = ->(u) {
  u.clean = AncestralRecordsAccessUtilities::Clean
  u.clean_add = AncestralRecordsAccessUtilities::CleanAdd
  u.clean_explain = AncestralRecordsAccessUtilities::CleanExplain
  u.done = AncestralRecordsAccessUtilities::Done
  u.make_error = AncestralRecordsAccessUtilities::MakeError
  u.feature_add = AncestralRecordsAccessUtilities::FeatureAdd
  u.feature_hook = AncestralRecordsAccessUtilities::FeatureHook
  u.feature_init = AncestralRecordsAccessUtilities::FeatureInit
  u.fetcher = AncestralRecordsAccessUtilities::Fetcher
  u.make_fetch_def = AncestralRecordsAccessUtilities::MakeFetchDef
  u.make_context = AncestralRecordsAccessUtilities::MakeContext
  u.make_options = AncestralRecordsAccessUtilities::MakeOptions
  u.make_request = AncestralRecordsAccessUtilities::MakeRequest
  u.make_response = AncestralRecordsAccessUtilities::MakeResponse
  u.make_result = AncestralRecordsAccessUtilities::MakeResult
  u.make_point = AncestralRecordsAccessUtilities::MakePoint
  u.make_spec = AncestralRecordsAccessUtilities::MakeSpec
  u.make_url = AncestralRecordsAccessUtilities::MakeUrl
  u.param = AncestralRecordsAccessUtilities::Param
  u.prepare_auth = AncestralRecordsAccessUtilities::PrepareAuth
  u.prepare_body = AncestralRecordsAccessUtilities::PrepareBody
  u.prepare_headers = AncestralRecordsAccessUtilities::PrepareHeaders
  u.prepare_method = AncestralRecordsAccessUtilities::PrepareMethod
  u.prepare_params = AncestralRecordsAccessUtilities::PrepareParams
  u.prepare_path = AncestralRecordsAccessUtilities::PreparePath
  u.prepare_query = AncestralRecordsAccessUtilities::PrepareQuery
  u.graphql_body = AncestralRecordsAccessUtilities::GraphqlBody
  u.graphql_errors = AncestralRecordsAccessUtilities::GraphqlErrors
  u.result_basic = AncestralRecordsAccessUtilities::ResultBasic
  u.result_body = AncestralRecordsAccessUtilities::ResultBody
  u.result_headers = AncestralRecordsAccessUtilities::ResultHeaders
  u.transform_request = AncestralRecordsAccessUtilities::TransformRequest
  u.transform_response = AncestralRecordsAccessUtilities::TransformResponse
}
