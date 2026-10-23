<?php
declare(strict_types=1);

// AncestralRecordsAccess SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class AncestralRecordsAccessMakeContext
{
    public static function call(array $ctxmap, ?AncestralRecordsAccessContext $basectx): AncestralRecordsAccessContext
    {
        return new AncestralRecordsAccessContext($ctxmap, $basectx);
    }
}
