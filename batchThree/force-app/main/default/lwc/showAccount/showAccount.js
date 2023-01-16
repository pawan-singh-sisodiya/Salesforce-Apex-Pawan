import { LightningElement, wire } from 'lwc';
import accountRecords from '@salesforce/apex/GetAccountController.GetAccounts';
import accountRecordsbyType from '@salesforce/apex/GetAccountController.getAccountByType';
import picklist from '@salesforce/apex/GetAccountController.getPicklistValues';
import contactList from '@salesforce/apex/GetAccountController.getContactByAccID';
export default class ShowAccount extends LightningElement {
    //wire as a property
    @wire(accountRecords)
    account;

    accountData;

    accountsByTypeData;
    accountType;

    accTypeOptions = [
      {"label" : "Prospect", "value" : "Prospect"},
      {"label" : "Customer", "value" : "Customer"},
    ];
    //wire as a function with param
    @wire(accountRecordsbyType, {type : '$accountType'} )
    getAccountDataByType(result){
     if(result.data){
       this.accountsByTypeData = result.data; 

     }
     if(result.error){
       console.log('@@---Error---@@'+ error);
     }
    }

    handleTypeChange(event){
      this.accountType = event.target.value;
    }

    accTypeDynamicPicklist;
    @wire(picklist)
    getAccountDataByTypeData(result){
     if(result.data){
      console.log('Account Type picklist', result.data);
       this.accTypeDynamicPicklist = result.data;

     }
     if(result.error){
       console.log('@@---Error---@@'+ error);
     }
    }

   
    accountDataOption;
    @wire(accountRecords)
    getAccountOptionsData({data, error}){
      if(data){
        console.log('data',data);
        this.accountDataOption = [];
        data.forEach(record =>{
            this.accountDataOption.push(
              {"label": record.Name, "value": record.Id}
            );
        });
      }
      if(error){
        console.log('Error Data', error); 
      }
    }
    contactListData;
    handleaccountChange(event){
      console.log('@@@@', event);
      let selectedAccountId = event.target.value;

      if(selectedAccountId){
        contactList({accId : selectedAccountId}).then(data => {
          this.contactListData = data;
          console.log('contactListData-->', this.contactListData);
        }).catch(error => {
          console.log('Error @@@', error);
        });
      }
    }

}