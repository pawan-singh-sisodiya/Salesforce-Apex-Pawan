import { LightningElement, track, wire } from 'lwc';
import accountData from '@salesforce/apex/PracticeAccountContactCount.accountMethod';
export default class PracticeAccountContactCount extends LightningElement {


    columns = [
        {label: 'sNo', fieldName: 'sNo'},
        {label: 'accName', fieldName: 'accName'},
        {label: 'contactCount', fieldName: 'contactCount'},

    ]

    @track accountRecords;

    @wire(accountData)
    getAccounts({data,error}){
        if(data){
            this.accountRecords = data;
        }
        else if(error){
            console.log('error', error);
        }
    }
}