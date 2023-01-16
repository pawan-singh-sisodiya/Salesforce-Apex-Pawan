trigger ContactTrigger on Contact (before update) {
    
    if(trigger.isBefore && trigger.isupdate){
        ContactTriggerHandler.test(Trigger.new);
    }
}