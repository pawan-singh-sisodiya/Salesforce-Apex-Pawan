trigger As1TriggerOpportunity on Opportunity (before insert, after insert, after update) {

    if((Trigger.isBefore) && (Trigger.isInsert || Trigger.isUpdate) ){
        
            AS1TriggerHandler.oppMethod(Trigger.new);
        }
    }