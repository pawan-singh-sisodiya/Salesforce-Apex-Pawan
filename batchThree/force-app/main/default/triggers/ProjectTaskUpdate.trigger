trigger ProjectTaskUpdate on Project_Task__c (before insert, before update, after insert, after update) {

  
    if(Trigger.isUpdate && Trigger.isAfter){
        ProjectTaskUpdateTriggerHandler.updateParentStatus(Trigger.new, Trigger.oldMap);
    } 
    /* else  if(Trigger.isUpdate && Trigger.isBefore){
        ProjectTaskUpdateTriggerHandler.updatePreiousCheckBox(Trigger.new, Trigger.oldMap);
    } */
}