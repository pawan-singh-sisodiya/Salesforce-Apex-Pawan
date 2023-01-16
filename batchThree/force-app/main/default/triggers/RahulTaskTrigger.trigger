trigger RahulTaskTrigger on Task (after insert, after update) {

    //------------- After Insert----------
      if (Trigger.isInsert && Trigger.isAfter) {
        RahulTaskTriggerHelper.taskInsertMethod(Trigger.new);
      }
    
    //------------- After Update----------
    if(Trigger.isUpdate && Trigger.isAfter){
         RahulTaskTriggerHelper.taskUpdateMethod(Trigger.new, Trigger.oldMap);
    }

}