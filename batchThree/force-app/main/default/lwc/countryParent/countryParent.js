import { api, LightningElement, track, wire } from 'lwc';
import countrydata from '@salesforce/apex/LwcomponentController.countryMethod';

export default class CountryParent extends LightningElement {

    @api countryRecords;
    @track countryPicklist;

    @api filteredRecords;
    @api selectedCountry;
    parsedCountryRecords;
    childShow = false;

    
    @wire(countrydata)
    getCountryList({data, error}){
        if(data){
            this.countryRecords = data;
            this.countryPicklist = [];
            this.countryRecords.forEach(con =>{
                this.countryPicklist.push(
                    {"label" : con.Name, "value" : con.Name},

                );
            });
        } 
        else if(error){
            console.log('Error handled', error);
        }
    }

    handleChange(event){
        this.childShow = false;
        this.selectedCountry= event.target.value;
        console.log('Seleted Country', this.selectedCountry);
    }

    handleChild(event){
        this.childShow = true;
        this.filteredRecords = this.countryRecords.filter(con =>{
            return this.selectedCountry == con.Name;
        });
        console.log('this.filteredRecords', this.filteredRecords);
    }
}

  /* connectedCallback(){
        countrydata().then(result =>{
            this.countryPicklist = [];
            result.forEach(con =>{
                this.countryPicklist.push(
                    {"label" : con.Name, "value" : con.Name},
                );
            });
        }).catch(error =>{
            console.log('error of data', error);
        });

    } */