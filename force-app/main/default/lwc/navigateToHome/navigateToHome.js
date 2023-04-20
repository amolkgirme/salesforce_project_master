import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateToHome extends NavigationMixin(LightningElement) {

    navigateToHome(){
        console.log('###');
        this[NavigationMixin.Navigate]({
            type:'standard__namedPage',
            attributes:{
                pageName :'home'
            }
        })
    }
    navigateToChatter(){
        console.log('###');
        this[NavigationMixin.Navigate]({
            type:'standard__namedPage',
            attributes:{
                pageName :'chatter'
            }
        })
    }
}