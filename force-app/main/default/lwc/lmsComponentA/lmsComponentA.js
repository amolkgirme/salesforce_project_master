import { LightningElement,wire } from 'lwc';
import SAMPLELMS from '@salesforce/messageChannel/SAMPLEMESSAGECHANNEL__c';
import { MessageContext,publish } from 'lightning/messageService';
export default class LmsComponentA extends LightningElement {
    inputValue;
    @wire(MessageContext)
    context

    inputHandler(event){
        this.inputValue=event.target.value;
    }
    publishMessage(){
        const message={
            lmsData:{
                value:this.inputValue
            }
        }
        //publish(messageContext, messageChannel, message)
        publish(this.context,SAMPLELMS,message)
    }
}