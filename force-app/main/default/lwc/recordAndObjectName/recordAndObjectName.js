import { LightningElement, api } from 'lwc';

export default class RecordAndObjectName extends LightningElement {
    @api recordId;
    @api objectApiName;
}