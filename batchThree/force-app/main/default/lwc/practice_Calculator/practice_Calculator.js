import { LightningElement, track } from 'lwc';

export default class Practice_Calculator extends LightningElement {

    @track firstvalue;
    @track secondValue;
    @track result;

    firstValueMethod(event){
        this.firstvalue = event.target.value;
    }

    secondValueMethod(event){
        this.secondValue = event.target.value;
    }

    addition(){
        this.result = parseInt(this.firstvalue) + parseInt(this.secondValue);
    }

    Subrtact(){
        this.result = parseInt(this.firstvalue) - parseInt(this.secondValue);
    }

    Multiply(){
        this.result = parseInt(this.firstvalue) * parseInt(this.secondValue);
    }

    Devide(){
        this.result = parseInt(this.firstvalue) / parseInt(this.secondValue);
    }
}