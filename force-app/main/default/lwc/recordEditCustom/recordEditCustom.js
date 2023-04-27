import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class RecordEditCustom extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    inputValue=''
    handleChange(event){
        this.inputValue = event.target.value;
        console.log('inputValue ##',this.inputValue);
    }
    handleSubmit(event){
        event.preventDefault();
        const inputCmp = this.template.querySelector('lightning-input')
        const value = inputCmp.value;
        console.log('Value ##',value);
        if(!value.includes('Australia')){
            inputCmp.setCustomValidity("The account name must include 'Australia")
        }else{
            inputCmp.setCustomValidity("")
            const fields = event.detail.fields
            fields.Name=value;
            this.template.querySelector('lightning-record-edit-form').submit(fields)
        }
        inputCmp.reportValidity()
    }
    handleSuccess(event){
        this.dispatchEvent(
            new ShowToastEvent({
                title:'Account Created',
                message:"Record Id "+event.detail.id,
                variant:"success"
            })
        )
    }
    handleError(event){
         this.dispatchEvent(
            new ShowToastEvent({
                title:'Error creating record',
                message:event.detail.message,
                variant:"error"
            })
        )

    }
}