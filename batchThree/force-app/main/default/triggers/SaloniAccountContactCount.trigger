trigger SaloniAccountContactCount on Account (before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        SaloniAccountCountHandler.accountMethod(Trigger.new);
    }
    
}