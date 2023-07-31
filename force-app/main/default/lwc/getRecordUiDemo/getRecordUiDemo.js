import { LightningElement, api, wire } from 'lwc';
import {getRecordUi} from 'lightning/uiRecordApi'

export default class GetRecordUiDemo extends LightningElement {
    @api recordId
    formFields

    formFields=[
        {fieldName:"AccounNumber","label":"Account Number"},
        {fieldName:"AnnualRevenue","label":"Annual Revenue"},
        {fieldName:"Name","label":"Name"},
        {fieldName:"Phone","label":"Phone"}
    ]

    @wire(getRecordUi,{recordId:'$recordId',layoutTypes:'Full',modes:'Edit'})
    accountRecordHander({data,error}){
        if(data){
            console.log('data getRecordUi ##',data);
            this.formFields = this.formFields.map(item=>{
                return {...item,value:data.records[this.recordId].fields[item.fieldName].value}
            })
            
        }
        if(error){
            console.log('error ##',error)
        }

    }
}