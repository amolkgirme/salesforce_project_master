import { LightningElement,wire } from 'lwc';
import {getNavItems} from 'lightning/uiAppsApi' 
export default class GetNavItemsDemo extends LightningElement {
    result;
    @wire(getNavItems,{
        naveItemNames:['standard-Account'],
       pageSize :30 
    })
    navItemsHandler({data}){
        if(data){
            this.result=data.navItems[0]
        }
    }
}