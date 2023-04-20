import { LightningElement, wire ,track} from 'lwc';

import getContacts from '@salesforce/apex/LwcHandler.getContacts';
import FETCH_CONTACTS from '@salesforce/apex/LwcHandler.fetchContacts';

export default class WireService extends LightningElement {

    @track conList=[];
    @track error;
    @track length;


    /*@wire(getContact)
    wireContact(result){
        if(result.data){
            this.conList=result.data;
            this.length=this.conList.length;

        }else if(result.error){
            error=result.error;
        }
    }*/
    showContact(){
    FETCH_CONTACTS()
        .then(data=>{
          
                this.conList=data;
                this.length=this.conList.length;
            
           
        })
        .catch(error=>{
            error=error;
        })

    }
}