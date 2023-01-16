trigger LikesTrigger on Like_and_Dialikes__c (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        LikesTriggercontroller.likesMethod(Trigger.new);
    }

}