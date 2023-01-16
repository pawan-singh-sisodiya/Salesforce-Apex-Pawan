import { LightningElement, track } from 'lwc';

const objects = [
    {Id: 'a', sNo: '1', ProductName: 'Product 1', Amount: '1000'},
    {Id: 'b', sNo: '2', ProductName: 'Product 2', Amount: '2000'},
    {Id: 'c', sNo: '3', ProductName: 'Product 3', Amount: '3000'},
    {Id: 'd', sNo: '4', ProductName: 'Product 4', Amount: '4000'},
    {Id: 'e', sNo: '5', ProductName: 'Product 5', Amount: '5000'},
]; 

const columns = [
    {label: 'sNo', fieldName: 'sNo'},
    {label: 'ProductName', fieldName: 'ProductName', type: 'text'},
    {label: 'Amount', fieldName: 'Amount', type: 'currency'},
];
export default class AjmerStaticAssignment extends LightningElement {
   
    myobj = objects;
    columns = columns;

    @track selectedCheckBox;
    @track sumAmount;
    @track quantity;
    
    handleCheckBox(event){
        this.selectedCheckBox = JSON.parse(JSON.stringify(event.detail.selectedRows));

        console.log('Selected checkbox data--> ', this.selectedCheckBox);

        this.sumAmount = 0;
        for(let i=0; i<this.selectedCheckBox.length; i++){
            this.sumAmount += parseInt(this.selectedCheckBox[i].Amount);

        }
        console.log('Total Sum of selected amount', this.sumAmount);
    }
  
}