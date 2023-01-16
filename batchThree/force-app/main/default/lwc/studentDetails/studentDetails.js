import { api, LightningElement, track } from 'lwc';

export default class StudentDetails extends LightningElement {
    @api studentDetails;
  
    @track studentdetailsData;

    connectedCallback(){
         console.log('Final Student Details', this.studentDetails);
         console.log('Final Student Id', this.getStudentId);
    }
    
}