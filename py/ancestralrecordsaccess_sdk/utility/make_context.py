# AncestralRecordsAccess SDK utility: make_context

from ancestralrecordsaccess_sdk.core.context import AncestralRecordsAccessContext


def make_context_util(ctxmap, basectx):
    return AncestralRecordsAccessContext(ctxmap, basectx)
