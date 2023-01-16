import { api, LightningElement } from 'lwc';

export default class CreateContcatChild extends LightningElement {
    @api accountId;

    connectedCallback(){
        console.log('child call back', this.accountId);
    }

    // Child to parent through custom event
    handleCancel(event){
        const myEvent = new CustomEvent('hidechild', {
            detail : {
                operationType : 'cancel'
            }
        });
        this.dispatchEvent(myEvent);
    }
}