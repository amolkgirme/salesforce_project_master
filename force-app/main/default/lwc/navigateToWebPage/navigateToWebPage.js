import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateToWebPage extends NavigationMixin(LightningElement) {
    naviagteToWeb(){
        this[NavigationMixin.Navigate]({
            type:"standard__webPage",
            attributes:{
                url:'https://www.youtube.com/'
            }
        })
    }
}