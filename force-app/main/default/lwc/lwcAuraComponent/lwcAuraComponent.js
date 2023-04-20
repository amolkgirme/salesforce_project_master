import { api, LightningElement } from 'lwc';

export default class LwcAuraComponent extends LightningElement {
    @api title;
    callAura(){
       this.dispatchEvent(
        new CustomEvent('sendmsg',{
            detail:{
            "msg":"Hello From LWC"
        }
    })
    )
}
}