import { LightningElement } from 'lwc';

export default class FirstLighteningButton extends LightningElement {
    fname;
    lname;
    student = {};

    show(event){
        let key =event.target.name;
        let value=event.target.value;

        this.student[key]=value;
    
    }
    handleClick(){
        alert(this.student.fname+' '+this.student.lname);
    
    }
}