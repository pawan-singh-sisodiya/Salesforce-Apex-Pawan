trigger Project_Triggers on Project_Trigger__c (after insert) {
    
    if (Trigger.isInsert && Trigger.isAfter) {
        ProjectTriggerHandler.createRecords(Trigger.new);
    }
}