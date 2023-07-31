import { LightningElement,wire } from 'lwc'
import {getPicklistValuesByRecordType, getObjectInfo} from 'lightning/uiObjectInfoApi'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'


export default class GetPicklistValuesByRecordTypeDemo extends LightningElement {

    ratingOptions
    selectedRating
    industryOptions
    selectedIndustry


    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectInfo

    @wire(getPicklistValuesByRecordType,{objectApiName:ACCOUNT_OBJECT,recordTypeId:'$objectInfo.data.defaultRecordTypeId'})
    picklistValueHandler({data,error}){
        if(data){
            this.ratingOptions = this.picklistGenerator(data.picklistFieldValues.Rating)
            this.industryOptions =this.picklistGenerator(data.picklistFieldValues.Industry)
    
        }else if(error){
            console.log('data1 ##',error)
        }

    }
    picklistGenerator(data){
        return data.values.map(item=>({label:item.label,value:item.value}))
    }

    handleChange(event){
        const {name,value} = event.target
        if(name=== 'industry'){
           this.selectedIndustry = value; 
        }else if(name === 'rating'){
            this.selectedRating = value;
        }
        
    }
}