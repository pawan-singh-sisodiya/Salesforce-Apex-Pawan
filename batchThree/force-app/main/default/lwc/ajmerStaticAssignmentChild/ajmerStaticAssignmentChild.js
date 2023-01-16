import { api, LightningElement } from 'lwc';


export default class AjmerStaticAssignmentChild extends LightningElement {
    @api getSelectedData;
    @api getTotalAmount;

    columns = [
        {label: 'sNo', fieldName: 'sNo'},
        {label: 'Product Name', fieldName: 'ProductName', type: 'text'},
        {label: 'Amount', fieldName: 'Amount', type: 'currency'},
    ]
}