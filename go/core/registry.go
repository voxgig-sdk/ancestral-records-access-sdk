package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewEnquiryEntityFunc func(client *AncestralRecordsAccessSDK, entopts map[string]any) AncestralRecordsAccessEntity

var NewGuideEntityFunc func(client *AncestralRecordsAccessSDK, entopts map[string]any) AncestralRecordsAccessEntity

var NewMcpEntityFunc func(client *AncestralRecordsAccessSDK, entopts map[string]any) AncestralRecordsAccessEntity

