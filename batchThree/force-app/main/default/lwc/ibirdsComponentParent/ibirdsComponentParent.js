import { LightningElement, track, wire } from 'lwc';
import getApexData from '@salesforce/apex/ibirdsComponentApex.getApexData';

export default class IbirdsComponentParent extends LightningElement {

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'AccountId', fieldName: 'AccountId' },
    ];

    @track containsWholeData;
    @track selectedData;

    @wire(getApexData)
    catchData({data, error}){
        if(data){
            this.containsWholeData = data;
            console.log('this.consdshdjknsjk', this.containsWholeData);
        }
        if(error){
            console.log('error', error);
        }
    }

    @track selectedId;

    handleClick(event){

        let RowId = event.currentTarget.id;
       console.log('row Id', RowId);

        //  this.selectedId = [];
        //  console.log('this.id',this.template.querySelector("lightning-datatable").getSelectedRows());
        // for(let i = 0; i <this.template.querySelector("lightning-datatable").getSelectedRows() ;i++){
        //     this.selectedId.push(this.template.querySelector("lightning-datatable").getSelectedRows()[i].Id);
        // }
        // console.log('this.id',JSON.parse(JSON.stringify(this.selectedId)));

        
    }
}