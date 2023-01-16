import { LightningElement, wire } from 'lwc';
import contactMethod from '@salesforce/apex/ContactLwcClass.contactMethod';

const  records = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email' },
    { label: 'Phone', fieldName: 'Phone' },
];

export default class BhavikaFirstAssignment extends LightningElement {
    columns = records;
    @wire(contactMethod)
   conRecords
  
}