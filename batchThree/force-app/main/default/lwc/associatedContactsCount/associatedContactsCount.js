import { LightningElement, track, wire } from 'lwc';
import accountData from '@salesforce/apex/AssociatedContactsCountController.contactMethod';
const columns = [
  {label : 'Serial Number', fieldName : 'sNo'},
  {label : 'Account Name', fieldName : 'accountName'},
  {label : 'Contact Count', fieldName : 'contactCount'},
]
export default class AssociatedContactsCount extends LightningElement {
   
  columns = columns;
    @track accountRecords;

    @wire(accountData)
    getAccountData({data, error}){
        if(data){
          this.accountRecords = data;
          console.log('Account related data', this.accountRecords);
        }
        else if(error){
          console.log('Error handled of account', error);
        }
    }
}