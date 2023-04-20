import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {
    selected={}
    correctAnswers=0;
    isSubmitted = false;
    myQuestions = [
        {
            id:"Que1",
            question:"Which is the capital of India ?",
            options:{
                a:"Delhi",
                b:"Pune",
                c:"Mumbai"
            },
            correctAnswer:"a",
        },
    
        {
            id:"Que2",
            question:"Which is the Pink city of India ?",
            options:{
                a:"Delhi",
                b:"Jaipur",
                c:"Udaypur"
            },
            correctAnswer:"b"
        },
        {
            id:"Que3",
            question:"Which is the Orage City of India",
            options:{
                a:"Pune",
                b:"Goa",
                c:"Nagpur"
            },
            correctAnswer:"c"
        }
   ]
   get allNotSelected(){
    return !(Object.keys(this.selected).length === this.myQuestions.length)
   }
   get isScoredFull(){
    return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswers? 'slds-text-color_success':'slds-text-color_error'}`
   }

    changeHandler(event){
        console.log('name',event.target.name);
        console.log('value',event.target.value);
        const {name, value}= event.target;
        this.selected ={...this.selected,[name]:value}
    }
    submitHandler(event){
        console.log('event##',event);
        this.isSubmitted=true;
        event.preventDefault();
        let correct = this.myQuestions.filter(item => this.selected[item.id] === item.correctAnswer);
        this.correctAnswers = correct.length
    }
    resetHandler(){
        this.isSubmitted=false;
        this.selected ={}
        this.correctAnswers=0;
    }
}
