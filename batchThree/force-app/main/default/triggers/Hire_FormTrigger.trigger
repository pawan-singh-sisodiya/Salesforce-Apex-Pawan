trigger Hire_FormTrigger on Hire__c (before insert, before update, after insert, after update) {
    
    if(trigger.isBefore){
        if(Trigger.isInsert){
            Hire_FormTriggerHandler.hireMethod(Trigger.New);
        }
      
    }
    
    if(Trigger.isUpdate){
       if(Trigger.isAfter){
            Hire_FormTriggerHandler.updateHireStatus(Trigger.New, Trigger.oldMap);
        }
       
    }
    
    
    
}