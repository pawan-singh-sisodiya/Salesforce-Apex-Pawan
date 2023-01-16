import { LightningElement, track, wire } from 'lwc';
import oppData from '@salesforce/apex/TestAccountContactController.oppMethod';
export default class OpportunityDynamicPicklist extends LightningElement {

    @track oppRecords;
   

    @wire(oppData)
    oppPicklist;
}