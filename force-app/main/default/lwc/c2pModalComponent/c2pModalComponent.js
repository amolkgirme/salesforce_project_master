import { LightningElement } from 'lwc';

export default class C2pModalComponent extends LightningElement {
    closeModal(){
        this.dispatchEvent(new CustomEvent('close',{
            bubbles:true,
            detail: {
                msg:"modal closed Successfully"
        }
    }));
    }
    footerHandler(){
        console.log('Footer handler called !!');
    }
}