import { LightningElement, wire } from 'lwc';
import contactData from '@salesforce/apex/ContactRecordsByName.conMethod';
import contactDataPicklist from '@salesforce/apex/ContactRecordsByName.contactMethod';
const rec = [
  {label : 'Name', fieldName : 'Name'},
  {label : 'Email', fieldName : 'Email'},
  {label : 'Phone', fieldName : 'Phone'},
  {label : 'City', fieldName : 'City__c'},
];
export default class ContactTableFilteredByName extends LightningElement {
  columns = rec;

    contactRecords;
    contactRecordTemp;
      
    @wire(contactData)
    contactDataMethod(result){
      if(result.data){
        console.log('Result data', result.data);
        this.contactRecords = result.data;
        this.contactRecordTemp = result.data;
      }
      if(result.error){
        console.log('Contact Records Error @@@', result.error);
      }
    }

    cityName;

    handleChange(event){
     this.cityName = event.target.value;
     console.log('City Name', this.cityName);

    this.contactRecords = this.contactRecordTemp.filter( con =>{ 
        return con.City__c ==  this.cityName;
    });
    }

    pickval;
    @wire(contactDataPicklist)
    contactPicklistMethod(result){
      if(result.data){
        this.pickval = result.data;
      }
      if(result.error){
        console.log('Error msg-', result.error);
      }
    }
}