import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getObjectInfos } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class GetObejectInfoDemo extends LightningElement {
    defaultRecordTypeId
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectInfo

    objectApiNames = [OPPORTUNITY_OBJECT,ACCOUNT_OBJECT]

    objectInfos
    @wire(getObjectInfos,{objectApiNames:'$objectApiNames'})
    objectInfosHandler({data}){
        if(data){
            this.objectInfos =data;
            console.log('data##',data);
        }
    }
    
    // {
    //     if(data){
    //         console.log('data ##',data);
    //         this.defaultRecordTypeId = data.defaultRecordTypeId;
    //     }
    //     if(error){
    //         console.log('error ##',error);
    //     }
    // }   
}