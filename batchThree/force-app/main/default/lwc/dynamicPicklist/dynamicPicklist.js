import { LightningElement, track, wire } from 'lwc';
import getPickListValues from '@salesforce/apex/OpportunityPicklistController.getPickListValues';
import opportunityListMethod from '@salesforce/apex/OpportunityPicklistController.opportunityListMethod';

export default class DynamicPicklist extends LightningElement {

    columns = [
        {label: 'Name', fieldName: 'Name'},
        {label: 'StageName', fieldName: 'StageName'},

    ]

    oppPicklist = [];

    @track selectedType;
    @track oppRecords;
    @track oppRecordsTemp;

    @wire(getPickListValues)
    getAccountDataByTypeData;

    @wire(opportunityListMethod)
    getData({data,error}){
        if(data){
            this.oppRecords = data;
            this.oppRecordsTemp = data;
            console.log('this.oppRecordsTemp', JSON.parse(JSON.stringify(this.oppRecordsTemp)));
        }
        else if(error){
            console.log('Errror', error);
        }
    }


    handler(event){
         this.selectedType = event.target.value;
        console.log('this.selectedType ', this.selectedType);
         this.oppRecords = this.oppRecordsTemp.filter(res=>{
            return this.selectedType == res.StageName;
         })
    }
}