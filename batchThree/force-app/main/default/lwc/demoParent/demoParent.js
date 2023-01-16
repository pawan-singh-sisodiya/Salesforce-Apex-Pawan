import { api, LightningElement, track, wire } from 'lwc';
//import accountData from '@salesforce/apex/HemantController.contactCountMethod';


export default class DemoParent extends LightningElement {

    showChild = false;
     accountRecords;
     contactCount;
/*
    @wire(accountData)
    getAccounts({data, error}){
        if(data){
            this.accountRecords = data;
        }
        else if(error){
            console.log('error handled', error);
        }
    }*/

    handleCheckBox(){
        this.contactCount = this.accountRecords.filter(res=>{
           
        });

        
        console.log('CheckBox checked', this.contactCount);

        console.log('account Reords', this.accountRecords);
    }
}