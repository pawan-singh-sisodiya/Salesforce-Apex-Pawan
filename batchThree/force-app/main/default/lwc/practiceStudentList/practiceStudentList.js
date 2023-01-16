import { api, LightningElement, track } from 'lwc';

export default class PracticeStudentList extends LightningElement {

    @api getStudentRecords;
    @track details;

    handleShowButton(event){
        let studentId = event.currentTarget.dataset.id;

        console.log('studentId', studentId);

        this.details = this.getStudentRecords.filter(res=>{
            return studentId == res.Id;
        });
        console.log('details-->', this.details);
    }
}