import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
export default class NavigateTovfPage extends NavigationMixin(LightningElement) {
    navigateTovfPage(){
        this[NavigationMixin.Navigate]({
            type:"standard__webPage",
            attributes:{
                url:"/apex/navigateVFpage"
            }
        }).then(generatedUrl=>{
            console.log('generatedUrl ##',generatedUrl);
            window.open(generatedUrl,"_blank")
        })
    }
}