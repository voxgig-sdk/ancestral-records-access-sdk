import { AncestralRecordsAccessEntityBase } from '../AncestralRecordsAccessEntityBase';
import type { AncestralRecordsAccessSDK } from '../AncestralRecordsAccessSDK';
import type { Control } from '../types';
import type { Mcp, McpLoadMatch, McpCreateData } from '../AncestralRecordsAccessTypes';
declare class McpEntity extends AncestralRecordsAccessEntityBase<Mcp> {
    constructor(client: AncestralRecordsAccessSDK, entopts: any);
    make(this: McpEntity): McpEntity;
    load(this: any, reqmatch?: McpLoadMatch, ctrl?: Control): Promise<McpEntity>;
    create(this: any, reqdata?: McpCreateData, ctrl?: Control): Promise<McpEntity>;
}
export { McpEntity };
