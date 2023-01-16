import { LightningElement, track, wire } from 'lwc';
import accountData from '@salesforce/apex/AccountContactTaskcontroller.accountMethod';

export default class AccountContactTask extends LightningElement {

  
    @track accountPickList;
    @track contactPickList;
    @track contactData;
    @track taskData;

   @track accountRecordsMap;
   @track accountRecords;

    @track selectedAccount;
    @track selectedContact;


    @wire(accountData)
    getAccounts({data, error}){
        if(data){
            console.log('data : ',data);
            this.contactData = data;
           // Account PickList data
            this.accountPickList = [];
         //   console.log('Entered in parent');
            this.accountRecordsMap = this.contactData.map( item => item.Account.Name);
         //  console.log('AccountName-->', this.accountRecordsMap);

             this.accountRecords = [...new Set(this.accountRecordsMap)];
           // console.log('Filtered Acc Name-->', this.accountRecords);
             
            this.accountRecords.forEach(item =>{
                this.accountPickList.push( {label : item, value: item} );
            });
        }
        else if(error){
            console.log('error handled', error);
        }
    }

    accountHandler(event){
        this.selectedAccount = event.target.value;

        this.contactPickList = [];

        if(this.selectedAccount){
            this.contactData.forEach(res=>{
                if(this.selectedAccount === res.Account.Name){
                    this.contactPickList.push({label: res.Name, value: res.Id});
                }
            });
            console.log('Contact List of Account related', this.contactPickList);
       }
    }

    contactHandler(event){
        this.selectedContactId = event.target.value;
        console.log('Selected Contact', this.selectedContactId);

        if(this.selectedContactId){
            this.contactData = JSON.parse(JSON.stringify(this.contactData));
            console.log(' this.contactData : ', this.contactData);
            this.contactData.forEach(res=>{
                if(this.selectedContactId == res.Id){
                    this.taskData = res.Tasks;
                }
            });
            console.log('Task Data', JSON.parse(JSON.stringify(this.taskData)));
        }
       
    }
}