import { LightningElement, wire } from 'lwc';
import {getPicklistValues,getObjectInfo} from 'lightning/uiObjectInfoApi';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
export default class GetPicklistValuesDemo extends LightningElement {
    selectedValue = '';
    selectedType = '';
    industryOptions=[]
    typeOptions=[]

    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    accountDetails

    @wire(getPicklistValues,{recordTypeId:'$accountDetails.data.defaultRecordTypeId',fieldApiName:INDUSTRY_FIELD})
    getpicklistValuesInIndustry({data,error}){
        if(data){
            console.log('values ##',data);
            this.industryOptions = this.generatePicklist(data);

        }
        if(error){
            console.log('error ##',error);
        }
    }
    @wire(getPicklistValues,{recordTypeId:'$accountDetails.data.defaultRecordTypeId',fieldApiName:TYPE_FIELD})
    getpicklistValuesInType({data,error}){
        if(data){
            console.log('values ##',data);
            this.typeOptions = this.generatePicklist(data);

        }
        if(error){
            console.log('error ##',error);
        }
    }

    generatePicklist(data){
        return data.values.map(item=>({label:item.label,value:item.value}))

    }

    handleChange(event) {
        this.selectedValue = event.detail.value;
    }
    handleTypeChange(event) {
        this.selectedType = event.detail.value;
    }
}