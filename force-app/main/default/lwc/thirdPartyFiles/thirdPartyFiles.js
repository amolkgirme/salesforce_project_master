import { LightningElement } from 'lwc';
import MOMENT from '@salesforce/resourceUrl/moment';
import ANIMATE from '@salesforce/resourceUrl/animate'
import {loadScript,loadStyle} from 'lightning/platformResourceLoader';
export default class ThirdPartyFiles extends LightningElement {
    currentDate;
    isLibLoaded =false;
    renderedCallback(){
        console.log('MOMENT##',MOMENT)
        if(this.isLibLoaded){
            return;
        }else{
            // Promise.all([
        //     loadScript(this,MOMENT+'/moment/moment.min.js')
        // ]).then(()=>{
        //     this.setDateOnScreen()
        // }).catch(error=>{
        //     console.log('error##',error);
        // })
       
        //If single file is present
        Promise.all([
            loadScript(this,MOMENT+'/moment/moment.min.js'),
            loadStyle(this,ANIMATE+'/animate/animate.min.css')
        ]).then(()=>{
            console.log('Inside resource ##')
            this.setDateOnScreen();
        })
        this.isLibLoaded=true;
        // loadScript(this,MOMENT+'/moment/moment.min.js').then(()=>{
        //     this.setDateOnScreen()
        // }).catch(error=>{
        //     console.log('error##',error);
        // })
        // loadStyle(this,ANIMATE+'/animate/animate.min.css').then(()=>{
        //     this.setDateOnScreen()
        // }).catch(error=>{
        //     console.log('error##',error);
        // })
        //this.isLibLoaded=true;
    }
}    
    setDateOnScreen(){
        console.log('moment ##',MOMENT);
       this.currentDate = moment().format('LLLL');
    }
}