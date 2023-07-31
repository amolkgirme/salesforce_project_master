import { LightningElement,wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import NAME_FIELD from '@salesforce/schema/Contact.Name';

export default class GetListUiDemoLwc extends LightningElement {
contacts=[]
pageToken =null
nextPageToken;
previousPageToken;
 @wire(getListUi,{
        objectApiName:CONTACT_OBJECT,
    listViewApiName:'AllContacts',
    pageSize : 5,
    sortBy:NAME_FIELD,
    pageToken :'$pageToken'
})
listViewHandler({data,error}){
    if(data){
        this.contacts= data.records.records;
        this.nextPageToken =data.records.nextPageToken;
        this.previousPageToken =data.records.previousPageToken;
    }
    else if(error){
        console.log('error ##',error);
    }
}
handlePreviousPage(){
    this.pageToken =this.previousPageToken
      console.log('this.previousPageToken ##',this.pageToken);

}
handleNextPage(){
    this.pageToken = this.nextPageToken
      console.log('this.nextPageToken ##',this.pageToken);

}
}