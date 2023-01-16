import { api, LightningElement, track, wire } from 'lwc';
import countryData from '@salesforce/apex/LwcomponentController.countryMethod';
export default class CountryChild extends LightningElement {

    childRecords;
    childRecordsTemp;
    @api childCountry;
    @api childList;

    connectedCallback(){
        if(this.childList){
            console.log('this.childList', this.childList);
            console.log('I am in connected call back of child');
        
              this.childRecords = JSON.parse(JSON.stringify(this.childList))[0];
        
              console.log('This.childRecords',this.childRecords);
        }
      
    }

   /*@wire(countryData)
    getCountryCrecords({data, error}){
       
        if(data){
            this.childRecords = data;
        }
        if(error){
            console.log('Error handled child country', error);
        }
    } */

    // @wire(countryData)
    // getFiltereddata({data, error}){
    //     if(data){
    //         if(this.childCountry){
    //             console.log('child country-->', this.childCountry);
    //             this.childRecordsTemp = this.childRecords.filter(con =>{
    //                 return this.childCountry == con.Name;
    //                });
    //         }
    //     }
    //     if(error){
    //         console.log('Error handled child country in filter method', error);
    //     } 
    //} 

}