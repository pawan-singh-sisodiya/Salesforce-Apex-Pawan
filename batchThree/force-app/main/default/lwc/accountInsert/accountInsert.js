import { LightningElement } from 'lwc';
import accountRecord from '@salesforce/apex/AccountInsertController.accMethod';

export default class AccountInsert extends LightningElement {

Name;
Phone;
insertRecord;
accountRecords = {
            Name : this.Name,
            Phone : this.Phone,
};
    handleAccount(event) {
      this.accountRecords.Name = event.target.value;
      console.log('Phone number',this.accountRecords.Name);
    }
    handleAccount1(event) {
        this.accountRecords.Phone = event.target.value;
        console.log('Phone number',this.accountRecords.Phone);
      }

      accountSave(){
        accountRecord({acc : this.accountRecords})
        .then(result=>{
            this.insertRecord = result;
            console.log('Inserted Records of Acccount', this.insertRecord);
        })
        .catch(error=>{
               console.log('Error of Account Insertion', error);
        });

      }
}