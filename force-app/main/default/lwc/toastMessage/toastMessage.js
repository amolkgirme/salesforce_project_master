import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ToastMessage extends LightningElement {
    
    student={}
    show(e){
        let key =e.target.name;
        let value=e.target.value;
        this.student[key]=value;
    
    }
    handleClick(){
        

        let name = this.student.fname+' '+this.student.lname;
        let toast = new ShowToastEvent({
                title:'Welcome',
                message:name,
                variant:this.variant ? this.variant:'success'
            });
        this.dispatchEvent(toast);
    
    }
    addvariant(r){
        this.variant= r.target.value;
    }
}