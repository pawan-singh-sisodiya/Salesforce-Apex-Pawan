import { LightningElement, track } from 'lwc';

export default class StaticComponent extends LightningElement {

    @track selectedRowData;

    myObj = [
        {SNo: '1', ProductName: 'Product 1', Amount: '1000'},
        {SNo: '2', ProductName: 'Product 2', Amount: '2000'},
        {SNo: '3', ProductName: 'Product 3', Amount: '3000'},
        {SNo: '4', ProductName: 'Product 4', Amount: '4000'},
        {SNo: '5', ProductName: 'Product 5', Amount: '5000'},
    ];

    columns= [
        {label: 'SNo' , fieldName: 'SNo'},
        {label: 'ProductName' , fieldName: 'ProductName'},
        {label: 'Amount' , fieldName: 'Amount'},
    ]

    handleCheckBox(event){
        this.selectedRowData = JSON.parse(JSON.stringify(event.detail.selectedRows));
        console.log('this.selected Row data', this.selectedRowData);
    }
}