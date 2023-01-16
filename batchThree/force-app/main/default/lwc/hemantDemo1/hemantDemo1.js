import { api, LightningElement, track, wire } from 'lwc';
import testData from '@salesforce/apex/HemantController.accountMethod';
export default class HemantDemo1 extends LightningElement {

    @track Name;
    @track Phone;
    Account;
    error;
    
    @track accountObj = 
        {Name: this.accountNamey, Phone: this.Phone};

    namehandler(event){
        this.accountObj.Name = event.target.value;
        
    }

    phonehandler(event){
        this.accountObj.Phone = event.target.value;
    }

    buttonClicked(){
        console.log('res : ',this.accountObj);
        testData({accName: JSON.stringify(this.accountObj)})
        .then(res=>{
            this.Account = res;
            console.log('res : ',res);
        }).catch(res=>{
            this.error = res;
            console.log('res : ',res);
        });
        console.log('Button clicked');
    }
}