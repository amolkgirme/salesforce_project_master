import { LightningElement, wire } from 'lwc';
import SAMPLELMS from '@salesforce/messageChannel/SampleMessageChannel__c';
import { APPLICATION_SCOPE, MessageContext,publish,subscribe,unsubscribe } from 'lightning/messageService';
export default class LmsComponentB extends LightningElement {
    receivedMessage
    subscription
    @wire(MessageContext)
    context
    connectedCallback(){
        this.subscribeMessage();
    }
    subscribeMessage(){
        this.subscription = subscribe(this.context,SAMPLELMS,(message)=>{this.handleMessage(message)},{scope:APPLICATION_SCOPE})
    }
    handleMessage(message){
        this.receivedMessage=message.lmsData.value? message.lmsData.value :'No Message Published';
    }
    unsubscribeMessage(){
        unsubscribe(this.subscription)
        this.subscription=null;
    }

}