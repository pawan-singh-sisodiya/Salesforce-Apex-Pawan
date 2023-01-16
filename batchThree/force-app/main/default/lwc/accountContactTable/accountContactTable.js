import { LightningElement, track, wire } from 'lwc';
import accountData from '@salesforce/apex/AccountContactTableController.accountMethod';

const item = [
    { label : 'Name', fieldName : 'Name' },
    { label : 'Industry', fieldName : 'Industry' },
    { label : 'FirstName', fieldName : 'FirstName' },
    { label : 'LastName', fieldName : 'LastName' },
];
export default class AccountContactTable extends LightningElement {

    columns = item;
    @track accountRecords;
    
    @wire(accountData)
    getAccountMethod({data, error}){
        if(data){
            this.accountRecords = data;
        }
        else if(error){
            console.log('Error -->', error);
        }
    }
}