import { LightningElement, track, wire } from 'lwc';
import accountContactTaskData from '@salesforce/apex/AccountContactTaskcontroller.contactMethod';
export default class BatchDemoParent extends LightningElement {

     accountData;
     @track accountRecords;
     @track childServe;

    @wire(accountContactTaskData)
    getAccountsData({data, error}){
        if(data){
            this.accountData = data;
            console.log('contact All Data', this.accountData);
            if(this.accountData){
                this.accountRecords = [];
                console.log('Entered in the loop');
                data.forEach(res=>{
                    this.accountRecords.push(
                        {label : res.Account.Name, value : res.Account.Id},
                    );
                    console.log('Account Picklist', this.accountRecords);
                });
            }
        }
        else if(error){
            console.log('Error handled ', error);
        }
    }

    accountHandler(event){
        let selectedAccountId = event.target.value;
        console.log('Selected Account Id', selectedAccountId);
        

        this.childServe=[];
        let child = this.accountData.filter(res=>{
            return selectedAccountId == res.Account.Id;
        });

        child.forEach(res=>{
            this.childServe.push(
                {label: res.Name, value: res.Id},
            )
        });

        console.log('Account to Child Data', this.childServe);
        
    }
}