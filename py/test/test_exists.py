# AncestralRecordsAccess SDK exists test

import pytest
from ancestralrecordsaccess_sdk import AncestralRecordsAccessSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = AncestralRecordsAccessSDK.test(None, None)
        assert testsdk is not None
