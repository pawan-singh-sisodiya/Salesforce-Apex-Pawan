import { LightningElement, track, wire } from 'lwc';
import contactRec from '@salesforce/apex/TestAccountContactController.contactMethod';
export default class TestAccountContact extends LightningElement {

    @track contactRecords;
    @track accountPicklist;
    @track contactPick;
    @track taskRecords;
     selectedAccountName;

    @wire(contactRec)
    getContactData({data, error}){
        if(data){
            this.contactRecords = data;
            
            this.accountPicklist =[];

            this.contactRecords.forEach(result=>{
                this.accountPicklist.push(
                    {label: result.Account.Name, value: result.Account.Name},
                )
            });
        }
        else if(error){
            console.log('error', error);
        }
    }

    accountHandler(event){
         this.selectedAccountName = event.target.value;
        console.log('Selected Account', this.selectedAccountName);

        this.contactPick = [];
        this.contactRecords.filter(res=>{
         if(this.selectedAccountName == res.Account.Name){
             this.contactPick.push(
                 {label: res.Name, value: res.Id},
             )
         }
        });
    }

    contactHandler(event){
        let selectedContactId = event.target.value;

        this.contactRecords.filter(res=>{
            if(selectedContactId == res.Id){
                this.taskRecords = res.Tasks; 
            }
        });
    }
}