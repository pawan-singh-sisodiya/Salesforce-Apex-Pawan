import { LightningElement, track } from 'lwc';

export default class AjmerComponentParent extends LightningElement {

    @track price;
    @track quantity;
    showChild = false;

    @track totalPrice;
    @track totalQty;

    priceHandler(event){
        this.price = event.target.value;
        console.log('Price', this.price);
    }

    qtyHandler(event){
        this.quantity = event.target.value;
        console.log('Quantity', this.quantity);

        if(this.price && this.quantity){
            this.showChild = true;
            this.totalPrice = parseInt(this.price) * parseInt(this.quantity);

            console.log('total Price', this.totalPrice);
             let percentage = parseInt((5 * this.totalPrice)/100);

             this.totalQty = percentage + this.totalPrice;
             console.log('total Price', this.totalQty);
        }
    }
}