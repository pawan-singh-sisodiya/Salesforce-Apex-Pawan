import { api, LightningElement } from 'lwc';

export default class IbirdsChild extends LightningElement {
    @api selectedIds;

    connectedCallback(){
        console.log('child data', JSON.parse(JSON.stringify(this.selectedIds)));
    }
}