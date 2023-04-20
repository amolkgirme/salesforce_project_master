import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class Notifications extends LightningElement {
  
    toastHandler(){
        this.showToast('success !!','{0} Account created {1}','success');
    }
    
    toastHandlerTwo(){
        this.showToast('Error !!','Account creation Failed','error')
    }
    
    toastHandlerThree(){
        this.showToast('Warning !!','Password Shoud have 15 charcter','warning')
    }
    
    toastHandlerfour(){
        this.showToast('Info !!','summer 20 release is available','info')
    }
    
    showToast(title,message,variant){
        this.dispatchEvent(
            new ShowToastEvent({
            title,
            message,
            variant,
            messageData:[
                'Salesforce',
                {
                    url:'https://www.google.com/',
                    label:'Click here'
                }
            ],
            mode:'sticky'
                
        })
        )
    }
}