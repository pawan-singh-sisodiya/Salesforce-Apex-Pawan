import { LightningElement, wire } from 'lwc';
import accPickVal from '@salesforce/apex/AccountPicklistController.accountPicklist';
export default class AccoutsComboboxData extends LightningElement {

    accountVal;

    @wire(accPickVal)
    getAccPicklist(result){

        if(result.data){
            this.accountVal = result.data;
        }
        if(result.error){
            console.log('@@@ Error of Picklist--->', result.error);
        }
    }
}