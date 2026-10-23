<?php
declare(strict_types=1);

// AncestralRecordsAccess SDK base feature

class AncestralRecordsAccessBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(AncestralRecordsAccessContext $ctx, array $options): void {}
    public function PostConstruct(AncestralRecordsAccessContext $ctx): void {}
    public function PostConstructEntity(AncestralRecordsAccessContext $ctx): void {}
    public function SetData(AncestralRecordsAccessContext $ctx): void {}
    public function GetData(AncestralRecordsAccessContext $ctx): void {}
    public function GetMatch(AncestralRecordsAccessContext $ctx): void {}
    public function SetMatch(AncestralRecordsAccessContext $ctx): void {}
    public function PrePoint(AncestralRecordsAccessContext $ctx): void {}
    public function PreSpec(AncestralRecordsAccessContext $ctx): void {}
    public function PreRequest(AncestralRecordsAccessContext $ctx): void {}
    public function PreResponse(AncestralRecordsAccessContext $ctx): void {}
    public function PreResult(AncestralRecordsAccessContext $ctx): void {}
    public function PreDone(AncestralRecordsAccessContext $ctx): void {}
    public function PreUnexpected(AncestralRecordsAccessContext $ctx): void {}
}
