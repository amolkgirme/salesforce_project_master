import { LightningElement } from 'lwc';
import search_account from '@salesforce/apex/LwcHandler.searchAccounts'

export default class DatatableExample extends LightningElement {
    handlekeychange(event){
        console.log(event.target.value);
        let searchValue=event.target.value;
        
        search_account({searchKey:searchValue})
        .then(result=>{
            let data=result;
            console.log('data '+data);
        })
        .catch(error=>{
            console.log('error '+error);

        })
    }
}