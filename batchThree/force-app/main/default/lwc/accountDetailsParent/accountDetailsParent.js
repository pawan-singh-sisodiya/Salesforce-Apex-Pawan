import { api, LightningElement } from 'lwc';
import getAccountById from '@salesforce/apex/GetAccountController.parentAccountMethod';
export default class AccountDetailsParent extends LightningElement {

    @api recordId;

    accountRecord;
    showContact = false;

    connectedCallback(){
        console.log('connected Call back-', this.recordId);
        if(this.recordId){
            getAccountById({accId : this.recordId}).then(result =>{
                console.log('accountRecord : ', result);
                this.accountRecord = result[0];
            }).catch(error =>{
                console.log('@@@ error', error)
            });
        }
    }

    handleContactBtn(){
        this.showContact = true;
    }

    handleHideChild(event){
        console.log('@@@ handleHideChild', event.detail.operationType);

        if(event.detail.operationType && event.detail.operationType == 'cancel'){
            this.showContact = false;
        }
    }

    //LifeCycle Hooks
    constructor(){
        super();
        console.log('constructor - ', this.recordId);
    }
}