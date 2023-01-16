import { LightningElement, track, wire } from 'lwc';
import contactData from '@salesforce/apex/AccountContactController.accountMethod';
export default class AssessmentParent extends LightningElement {


    @track contactRecords;
    
    @track accountNames;
    @track selectedAccountName;
    @track childServeRecords;

  @wire(contactData)
  accountContactMethod({data,error}){
    if(data){
        this.contactRecords = data;
        console.log('this.contactRecords', this.contactRecords);

        this.accountNames = [];

        this.contactRecords.forEach(res=>{
            this.accountNames.push(
                {label: res.Account.Name, value: res.Account.Name},
            );
        });
    }
    else if(error){
        console.log('error',error);
    }
  }

  accountHandler(event){
    this.selectedAccountName = event.target.value;
    console.log('this.AccountName', this.selectedAccountName);

   this.childServeRecords =  JSON.parse(JSON.stringify(this.contactRecords)).filter(res=>{
       return this.selectedAccountName == res.Account.Name;
    });

   

    console.log('this.childServe',  JSON.parse(JSON.stringify(this.childServeRecords)));
  }
   
}