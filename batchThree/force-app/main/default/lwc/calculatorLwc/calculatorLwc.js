import { LightningElement, track } from 'lwc';

export default class CalculatorLwc extends LightningElement {

    firstNum;
    secondNum;
    result;

    operator;

    get comboBoxOptions(){
        return [
            {'label' : '+', 'value' : '+'},
            {'label' : '-', 'value' : '-'},
            {'label' : '*', 'value' : '*'},
            {'label' : '/', 'value' : '/'},
        ]
    }

    handleEvent1(evt){
        this.firstNum = evt.target.value;
    }

    handleEvent2(evt){
        this.secondNum = evt.target.value;
    }

    handleOperator(evt){
        this.operator = evt.target.value;
    }

    calculateOperation(){
        if(this.operator === '+'){
            this.result = parseInt(this.firstNum) + parseInt(this.secondNum);
            console.log('Addition-->', this.result);
        }
        else if(this.operator === '-'){
            this.result = parseInt(this.firstNum) - parseInt(this.secondNum);
            console.log('Addition-->', this.result);
        }
        else if(this.operator === '*'){
            this.result = parseInt(this.firstNum) * parseInt(this.secondNum);
            console.log('Addition-->', this.result);
        }
        else if(this.operator === '/'){
            this.result = parseInt(this.firstNum) / parseInt(this.secondNum);
            console.log('Addition-->', this.result);
        }
    }

}