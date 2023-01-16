import { LightningElement, track, wire } from 'lwc';
import countryData from '@salesforce/apex/LwcomponentController.countryCountMethod';
export default class PracticeCountryVisitedChild extends LightningElement {

    @track countryRecords;
    @track countArray =[];
    

    @wire(countryData)
    getCountryCount({data, error}){
        if(data){
            this.countryRecords = data;
        }
        else if(error){
            console.log('Error handled', error);
        }
    }

    handleClick(event){
        let check = event.target.checked;
        let selectedId = event.currentTarget.dataset.id;
        console.log('selected Id', selectedId);
        console.log('Check box ', check);

        let count;
       

        
            if(!this.countArray.includes(selectedId)){
            this.countArray.push(selectedId);
            }
           else{
            let index = this.countArray.indexOf(selectedId);
            this.countArray.splice(index,1);
            }
            count = this.countArray.length
            console.log('size of array', count);


            const myevent = new CustomEvent('count', {
                detail:{
                    visited : this.countArray.length
                }
            });

            this.dispatchEvent(myevent);
    }

  
}