import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    isChildVisible;
    connectedCallback(){
        console.log("Inside Parent connected callback");
    }
    constructor(){
        super()
            console.log('Inside Parent Constructor');
        
    }
    renderedCallback(){
        console.log('Parent rendered Callbacack');
    }
    name
    changeHandler(event){
        this.name = event.target.value;
    }
    handleClick(){
       this.isChildVisible =! this.isChildVisible;
    }
    errorCallback(error,stack){
        console.log(error.message);
        console.log(stack);
    }

}