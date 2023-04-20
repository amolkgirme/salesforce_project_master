import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html'
import signoutTemplate from './signoutTemplate.html'
import renderTemplate from './renderMethod.html'

export default class RenderMethod extends LightningElement {
    selectedButton=''
    render(){
        return this.selectedButton === 'Signin'? signinTemplate :
        this.selectedButton ==='Signout'? signoutTemplate:renderTemplate;
    }
    handleClick(event){
        this.selectedButton=event.target.label;
    }
    submitHandler(event){
        console.log(`${event.target.value} Form submitted successfully !!`);
    }
}