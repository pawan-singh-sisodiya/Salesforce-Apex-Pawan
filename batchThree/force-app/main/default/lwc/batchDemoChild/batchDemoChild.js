import { api, LightningElement, track } from 'lwc';

export default class BatchDemoChild extends LightningElement {

   @api contactData;
   @api contactCompleteData;
   @track taskData;

   contactHandler(event){
    let contactId = event.target.value;
    console.log(JSON.parse(JSON.stringify(this.contactCompleteData)));
    this.taskData= this.contactCompleteData.filter(res=>{
        return res.Tasks && contactId == res.Tasks.WhoId;
    });

    console.log('task data', this.taskData);

    console.log('contactId', contactId);
   }



}