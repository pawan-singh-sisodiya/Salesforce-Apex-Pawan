trigger Hire_Case_Trigger on Case (before insert, before update) {

    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            HireCaseTrigger.updateStatus(Trigger.new, Trigger.oldMap);
        }
    }
}