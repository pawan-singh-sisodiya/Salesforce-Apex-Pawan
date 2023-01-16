import { LightningElement, track, wire } from 'lwc';
import contactData from '@salesforce/apex/PracticeController.contactMethod';

const columns =[
    {label: 'FirstName', fieldName: 'FirstName'},
    {label: 'LastName', fieldName: 'LastName'},
    {label: 'Email', fieldName: 'Email'},
    {label: 'Phone', fieldName: 'Phone'},
    {label: 'City', fieldName: 'City__c'},
]
export default class PracticeFilterContactCityDataTable extends LightningElement {
    columns = columns;

    @track contactRecords;
    @track contactRecordsTemp;
    @track contactPicklist;

    @wire(contactData)
    getcontacts({data, error}){
        if(data){
            this.contactRecords = data;
            this.contactRecordsTemp = data;

            this.contactPicklist = [];
            let unique = [];
            this.contactRecords.forEach(res=>{
                if(!unique.includes(res.City__c)){
                    this.contactPicklist.push(
                        {label: res.City__c, value: res.City__c},
                    );

                    unique.push(res.City__c);
                }
            });
        }
        else if(error){

        }
    }

    handleCity(event){
        let SelectedCity = event.target.value;

        this.contactRecords = this.contactRecordsTemp.filter(res=>{
            return SelectedCity == res.City__c;
        })
    }
}