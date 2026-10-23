<?php
declare(strict_types=1);

// AncestralRecordsAccess SDK exists test

require_once __DIR__ . '/../ancestralrecordsaccess_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = AncestralRecordsAccessSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
