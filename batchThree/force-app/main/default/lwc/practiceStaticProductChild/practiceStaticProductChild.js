import { api, LightningElement } from 'lwc';

export default class PracticeStaticProductChild extends LightningElement {
    
    @api rows;

    columns = [
        {label: 'SNo', fieldName: 'SNo'},
        {label: 'ProductName', fieldName: 'ProductName'},
        {label: 'Amount', fieldName: 'Amount'},
    ];

}