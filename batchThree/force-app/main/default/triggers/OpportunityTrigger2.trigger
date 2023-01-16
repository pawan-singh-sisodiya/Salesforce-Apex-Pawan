trigger OpportunityTrigger2 on Opportunity (before insert) {
    if(trigger.isbefore && trigger.isInsert){
        OpportunityHelper.opportunityUpdate(trigger.new);
    }
}