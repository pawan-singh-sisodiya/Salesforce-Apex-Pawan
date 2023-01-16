import { LightningElement, track, wire } from 'lwc';
import contactData from '@salesforce/apex/PracticeController.contactTaskMethod';


export default class PracticeAccountContactTask extends LightningElement {

    
    @track contactRecords;
    @track accountPicklist;
    @track contactPickList;
    @track taskRecords;
    @track showTask = false;

    @wire(contactData)
    getcontacts({data, error}){
        if(data){
            this.contactRecords = data;

            // Account PickList
            this.accountPicklist = [];
            this.contactRecords.forEach(res=>{
                if(res.Account.Name){
                    this.accountPicklist.push(
                        {label: res.Account.Name, value: res.Account.Name},
                    );
                }
            });
        }
        else if(error){
            console.log('error Occured', error);
        }
    }

    accountHandler(event){
        this.selectedAccount = event.target.value;
        console.log('selected Account', this.selectedAccount);

        this.contactPickList = [];
       this.contactRecords.filter(res=>{
        if(this.selectedAccount == res.Account.Name){
            this.contactPickList.push(
                {label: res.Name, value: res.Id},
            );
        }
       });
    }

    contactHandler(event){
        let selectedContactId = event.target.value;
      console.log('Contact Recrods', selectedContactId);
      this.contactRecords = JSON.parse(JSON.stringify(this.contactRecords));
      this.contactRecords.forEach(res=>{
        if(selectedContactId == res.Id){
            this.taskRecords = res.Tasks;
            
            console.log('Task Recrods-->', this.taskRecords);
        }
       // this.taskRecords = JSON.parse(JSON.stringify(this.taskRecords));
      });

      
      this.showTask = true;
    }
}