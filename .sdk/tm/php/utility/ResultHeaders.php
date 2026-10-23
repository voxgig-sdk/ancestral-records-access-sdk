<?php
declare(strict_types=1);

// AncestralRecordsAccess SDK utility: result_headers

class AncestralRecordsAccessResultHeaders
{
    public static function call(AncestralRecordsAccessContext $ctx): ?AncestralRecordsAccessResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
