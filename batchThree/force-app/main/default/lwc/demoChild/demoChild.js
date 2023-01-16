import { api, LightningElement } from 'lwc';

const columns = [
    {label : 'sNo', fieldName : 'sNo'},
    {label : 'accountName', fieldName : 'accountName'},
    {label : 'count', fieldName : 'count'},
]
export default class DemoChild extends LightningElement {

    columns = columns;
    @api contactRecords;

    connectedCallback(){
        console.log('Demo child Records', JSON.parse(JSON.stringify(this.contactRecords)));
        console.log('Hi saloni');
    }

}