import {track, api, LightningElement, wire } from 'lwc';
import studentData from '@salesforce/apex/StudentLWCController.studentMethod';
export default class StudentCity extends LightningElement {

@track studentRecords;
@api studentRecordsTemp;
@track studentCity;
@track selectedCity;
unique;
@track showStudentList = false;

@wire(studentData)
getStudents({data, error}){
    if(data){
        this.studentRecords = data;
       // this.studentRecordsTemp = data;
        if(this.studentRecords){
            this.studentCity= [];
            let unique = [];
            data.forEach(res =>{
                if(!unique.includes(res.City__c)){
                    unique.push(res.City__c);
                    this.studentCity.push(
                        {"label": res.City__c, "value": res.City__c},
                       );
                }
            });
        }
    }
    else if(error){
        console.log('Error handled of Parent', error);
    }
}

handleCity(event){
//    this.showStudentList = true;
    this.selectedCity = event.target.value;
    console.log('this.SelectedCity', this.selectedCity);
    this.studentRecordsTemp = this.studentRecords.filter(res =>{
        return this.selectedCity == res.City__c;
    });
  
    console.log('this.Student Temp', this.studentRecordsTemp);
   
}

}