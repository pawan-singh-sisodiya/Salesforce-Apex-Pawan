import { api, LightningElement, track } from 'lwc';

export default class AjmerComponentChild extends LightningElement {

    @api childPrice;
    @api childQty;

}