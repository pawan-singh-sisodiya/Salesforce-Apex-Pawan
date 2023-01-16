import { api, LightningElement, track } from 'lwc';

export default class StudentList extends LightningElement {

    @api students;
    studentRecords;
    showThirdChild = false;
    studentId;
    @track StudentDetailServe;

    connectedCallback(){
        console.log('Entered in child');
       // this.studentRecords = this.students;
        console.log('child list-->', this.students);
        this.showThirdChild = false;
    }

    showDetails(event){
        
        console.log('Show details button clicked');

        this.studentId = event.currentTarget.dataset.id;
        console.log('this.studentId', this.studentId);

        this.StudentDetailServe = this.students.filter(con =>{
            return this.studentId == con.Id;
        });



        console.log('third Child', this.StudentDetailServe);

    }
}