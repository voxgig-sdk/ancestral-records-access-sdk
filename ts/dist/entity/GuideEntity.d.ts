import { AncestralRecordsAccessEntityBase } from '../AncestralRecordsAccessEntityBase';
import type { AncestralRecordsAccessSDK } from '../AncestralRecordsAccessSDK';
import type { Control } from '../types';
import type { Guide, GuideCreateData } from '../AncestralRecordsAccessTypes';
declare class GuideEntity extends AncestralRecordsAccessEntityBase<Guide> {
    constructor(client: AncestralRecordsAccessSDK, entopts: any);
    make(this: GuideEntity): GuideEntity;
    create(this: any, reqdata?: GuideCreateData, ctrl?: Control): Promise<GuideEntity>;
}
export { GuideEntity };
