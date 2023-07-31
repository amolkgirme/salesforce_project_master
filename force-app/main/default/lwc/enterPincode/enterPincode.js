import { LightningElement, track } from 'lwc';
import getPostOfficeInfo from '@salesforce/apex/SalesForceIntegration.getPostOfficeInfo';


export default class EnterPincode extends LightningElement {
    @track pincode;
    showaddress=false;
    address;
   
    addPin(event){
        this.pincode=event.target.value;
        console.log(this.pincode);
    }
    handleclick(){
        this.showaddress=true;
        getPostOfficeInfo({pincode : this.pincode}).then(result => {
            console.log(result);
            this.address= result;
        })
        .catch(error => {
            this.error = error;
        });
        
    }

}