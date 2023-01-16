import { LightningElement, track, wire } from 'lwc';
//import ravindraData from '@salesforce/apex/PracticeController.ravindraMethod';
export default class RavindraPractice extends LightningElement {

    myObj = [
        {SNo: '1', ProductName: 'Product 1', Amount: '1000'},
        {SNo: '2', ProductName: 'Product 2', Amount: '2000'},
        {SNo: '3', ProductName: 'Product 3', Amount: '3000'},
        {SNo: '4', ProductName: 'Product 4', Amount: '4000'},
        {SNo: '5', ProductName: 'Product 5', Amount: '5000'},

    ];

    columns = [
        {label: 'SNo', fieldName: 'SNo'},
        {label: 'ProductName', fieldName: 'ProductName'},
        {label: 'Amount', fieldName: 'Amount'},
    ];

    @track selectedRowsData;

    helperMethod(event){
        this.selectedRowsData = JSON.parse(JSON.stringify(event.detail.selectedRows));
        console.log('this.selectedRows', this.selectedRowsData);
    }
}