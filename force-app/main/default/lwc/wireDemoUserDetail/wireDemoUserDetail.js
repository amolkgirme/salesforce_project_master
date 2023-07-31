import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import {getRecord} from 'lightning/uiRecordApi'
import NAME_FIELD from '@salesforce/schema/User.Name'
import EMAIL_FIELD from '@salesforce/schema/User.Email'
export default class WireDemoUserDetail extends LightningElement {
    userId = Id;
    /*
    @wire(adapter,adapterConfig)
    propertyOrFunction
    */
   userDetail
   @wire(getRecord,{recordId:'$userId',fields:[NAME_FIELD,EMAIL_FIELD]})
   userDetailHandler({data,error}){
    if(data){
        this.userDetail = data.fields;
    }
    if(error){
        console.log('error ##',error);
    }
   }
   /*userdetailHandler(response){
    console.log('response data ##',response.data);
    console.log('response  error##',response.error);
   }*/
   @wire(getRecord,{recordId:'$userId',fields:[NAME_FIELD,EMAIL_FIELD]})
   userdetailProperty
}