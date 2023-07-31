import { LightningElement,track } from 'lwc';
import traceAddress from '@salesforce/apex/Http_IP_Tracing.traceAddress';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HttpIPTracingComp extends LightningElement {
@track ipAddres;
@track outPut;
@track error;
    handlechange(event){
        this.ipAddress = event.target.value;
        console.log('this.ipAddress',this.ipAddress);
    }
    handleClick(){
        console.log('##',this.ipAddress);
        traceAddress({ipAddess: this.ipAddress}).then(result=>{
            if(result){
                this.outPut=result;
                console.log(this.outPut);
            }
        })
        .catch(error=>{
            this.error=error;
            console.log('error',this.error);
            const evt = new ShowToastEvent({
                title: 'Result',
                message: JSON.stringify(this.error),
                variant: 'error',
            });
            this.dispatchEvent(evt);
        });
    }
}