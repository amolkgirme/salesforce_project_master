import { LightningElement } from 'lwc';

export default class LifeCycleChild extends LightningElement {
    interval
    connectedCallback(){
        console.log("Inside Child connected callback");
        throw new Error('Loading of child component failed');
    }
    constructor(){
        super()
        console.log('Inside Child Constructor');
        
    }
    renderedCallback(){
        console.log('Child rendered Callbacack');
    }
   disconnectedCallback(){
    alert('Child disconnectedCallback Called !!');
   }


}