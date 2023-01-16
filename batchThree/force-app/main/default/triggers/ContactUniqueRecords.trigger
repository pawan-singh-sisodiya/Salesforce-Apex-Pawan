trigger ContactUniqueRecords on Contact (before insert) {

    //Before Insert
    if (Trigger.isInsert && Trigger.isBefore) {
        ContactUniqueTriggerHandler.uniqueContactFields(Trigger.new);
    }
    
    
}