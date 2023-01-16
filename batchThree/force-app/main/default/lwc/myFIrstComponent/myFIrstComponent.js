import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MyFIrstComponent extends LightningElement {


   myTitle = "SalesForce Noob";

   /* connectedCallback(){
        
       const name = "Hemant"
       name = "Shivam"
       window.alert(name)
    } */

    // 1st Method
    handleClick(){
        this.showToast(this.myTitle);
    }

    // 2nd Method

    showToast(firstArg){
        const eventvar = new ShowToastEvent({
            title: firstArg,
            message: 'Wants to show toast message',
            variant: 'error',
        })

        this.dispatchEvent(eventvar);
    }

    connectedCallback(){
        let divi = this.myFunction(10, 3);

        window.alert("Your value-"+divi);
    }
    myFunction = (divident, divisor) => {
      return(divident/divisor);
    }


}