import { LightningElement, track, wire } from 'lwc';
import contactData from '@salesforce/apex/PracticeController.accountContactTask';
export default class DemoAadi extends LightningElement {

    columns = [
        {label: 'Subject', fieldName: 'Subject'},
        {label: 'Status', fieldName: 'Status'},
        {label: 'OwnerId', fieldName: 'OwnerId'},
        {label: 'ActivityDate', fieldName: 'ActivityDate'},
    ]

    @track contactRecords;
    @track accountName;
    @track contactName;

    @track taskRecords;

    @wire(contactData)
    getContacts({data, error}){
        if(data){
            this.contactRecords = data;
            console.log('this.contactRecords',this.contactRecords);

            this.accountName = [];
            this.contactRecords.forEach(res=>{  //lemda function
                this.accountName.push(
                    {label: res.Account.Name, value: res.Account.Name},
                )
            });

        }
        else if(error){
            console.log('error', error);
        }
    }

    handleAccount(event){
        let selectedAccount = event.target.value;
        console.log('selected Account', selectedAccount);

        this.contactName = [];

        this.contactRecords.forEach(res=>{
            if(selectedAccount == res.Account.Name){
                this.contactName.push(
                    {label: res.Name, value: res.Id},
                )
            }
           
        });
    }

    contactHandler(event){
        let selectedContactId = event.target.value;
        console.log('selected Contact Id', selectedContactId);

        this.contactRecords.forEach(res=>{
            if(selectedContactId == res.Id){

                this.taskRecords = res.Tasks;
                console.log('this.tasks', this.taskRecords);
            }
        })
    }
}