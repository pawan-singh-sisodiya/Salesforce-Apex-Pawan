import { api, LightningElement } from 'lwc';

export default class AssessmentChild extends LightningElement {

    @api getContactRecords;

    columns= [
        {label: 'Name', fieldName: 'Name'},
        {label: 'Phone', fieldName: 'Phone'},
        {label: 'Email', fieldName: 'Email'},
        {label: 'City__c', fieldName: 'City__c'},
        {label: 'AccountId', fieldName: 'AccountId'},
    ];


    connectedCallback(){
        console.log('getContactson child', this.getContactRecords);
    }
}