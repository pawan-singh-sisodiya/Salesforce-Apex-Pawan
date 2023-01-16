import { LightningElement, track, wire } from 'lwc';
import studentData from '@salesforce/apex/PracticeController.studentMethod';
export default class PracticeStudentCity extends LightningElement {

    @track studentRecords;
    @track studentCityPicklist;
    @track studentsList;

    @wire(studentData)
    getStudents({data, error}){
        if(data){
            this.studentRecords = data;

            this.studentCityPicklist = [];
            let unique = [];
            this.studentRecords.forEach(res=>{

                if(!unique.includes(res.City__c)){
                    this.studentCityPicklist.push(
                        {label: res.City__c, value: res.City__c},
                     );
                     unique.push(res.City__c);
                }
            });
        }
        else if(error){
            console.log('Error handled', error);
        }
    }

    cityClicked(event){
        let selectedCity = event.target.value;

        this.studentsList = this.studentRecords.filter(res=>{
            return selectedCity == res.City__c;
        });
        console.log('this.studentsList', JSON.parse(JSON.stringify(this.studentsList)));
    }
}