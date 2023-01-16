import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/WireDemoBySalesforceNoob.contactMethod';

const items = [
    { label : 'Name', fieldName : 'Name'},
    { label : 'Account Record Id', fieldName : 'Id'},
];
export default class WireDemoBySalesforceNoob extends LightningElement {

    @track columns = items;
    @track contactData = [];

    @wire(getContacts)
    wiredContact({data, error}){
        if(data){
            this.contactData = data;
        }
        if(error){
           console.log('Error Occured -->', error);
        }
    }

}