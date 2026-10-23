import { AncestralRecordsAccessEntityBase } from '../AncestralRecordsAccessEntityBase';
import type { AncestralRecordsAccessSDK } from '../AncestralRecordsAccessSDK';
import type { Control } from '../types';
import type { Enquiry, EnquiryCreateData } from '../AncestralRecordsAccessTypes';
declare class EnquiryEntity extends AncestralRecordsAccessEntityBase<Enquiry> {
    constructor(client: AncestralRecordsAccessSDK, entopts: any);
    make(this: EnquiryEntity): EnquiryEntity;
    create(this: any, reqdata?: EnquiryCreateData, ctrl?: Control): Promise<EnquiryEntity>;
}
export { EnquiryEntity };
