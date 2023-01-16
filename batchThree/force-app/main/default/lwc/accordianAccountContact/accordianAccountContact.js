import { LightningElement, wire, track } from 'lwc';
import accountData from '@salesforce/apex/AcordianAccountContactController.accountMethod';
export default class AccordianAccountContact extends LightningElement {

    @track accountRecords;
    @track accountRecordsSecond;
    @track accountRecordsTemp;

    @wire(accountData)
    getAccountRecords({data, error}){
        if(data){
            this.accountRecords = data;
        }
        else if(error){
            console.log('Error of Account', error);
        }
    }
}