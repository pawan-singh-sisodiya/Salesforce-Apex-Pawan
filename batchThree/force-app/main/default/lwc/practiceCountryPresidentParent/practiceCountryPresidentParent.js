import { LightningElement, track, wire } from 'lwc';
import countryData from '@salesforce/apex/PracticeController.countryMethod';
export default class PracticeCountryPresidentParent extends LightningElement {

    @track countryRecords;
    @track countryPickList;
    @track selectedCountry;
    @track childServe;

    @wire(countryData)
    getData({data, error}){
        if(data){
            this.countryRecords = data;
            if(this.countryRecords){
                this.countryPickList = [];
                
                this.countryRecords.forEach(res=>{
                        this.countryPickList.push(
                            {"label" : res.Name, "value": res.Name},
                        );
                });
            }
          
        }
        else if(error){
            console.log('error handled', error);
        }
    }

    handleChange(event){
        this.selectedCountry = event.target.value;

        console.log('selected Country-->', this.selectedCountry);
        this.childServe = this.countryRecords.filter(con=>{
            return this.selectedCountry == con.Name;
        });

        console.log('this.childServe@@@', this.childServe);
        
    }
}