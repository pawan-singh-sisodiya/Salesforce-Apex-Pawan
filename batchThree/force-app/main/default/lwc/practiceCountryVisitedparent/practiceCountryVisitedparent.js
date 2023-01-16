import { api, LightningElement } from 'lwc';

export default class PracticeCountryVisitedparent extends LightningElement {
    @api totalc;

     totalCount(event){
        let tempvar = JSON.parse(JSON.stringify(event.detail));
        this.totalc = tempvar.visited;
    }
}