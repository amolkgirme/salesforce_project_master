import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils'
export default class NavigateToObjectPage extends NavigationMixin(LightningElement) {
    navigateToNewRecord(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes :{
                objectApiName : 'Contact',
                actionName:'new'
            }
        })
    }
    navigateToNewRecordWWithDefault(){
        const defaultValues = encodeDefaultFieldValues({
            FirstName :'Zero',
            LastName:'Hero',
            LeadSource:'Other'
        })
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes :{
                objectApiName : 'Contact',
                actionName:'new'
            },
            state:{
                defaultFieldValues : defaultValues 
            }
        })
    }
    navigateToListView(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes :{
                objectApiName : 'Contact',
                actionName:'list'
            },
            state:{
                filterName :'00B5j0000031wOIEAY'
            }
        })
    }
    navigateToFiles(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes :{
                objectApiName : 'ContentDocument',
                actionName:'home'
            }
        })
    }
}