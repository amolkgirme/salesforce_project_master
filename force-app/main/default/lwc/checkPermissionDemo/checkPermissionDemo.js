import { LightningElement } from 'lwc';
import hasViewAllData from '@salesforce/userPermission/ViewAllData';
import nyCustonPermission from '@salesforce/customPermission/show_details';
export default class CheckPermissionDemo extends LightningElement {
    get hasViewAllDataAvailable(){
        return hasViewAllData;
    }
    get hasCustomPermission(){
        return nyCustonPermission;
    }
}