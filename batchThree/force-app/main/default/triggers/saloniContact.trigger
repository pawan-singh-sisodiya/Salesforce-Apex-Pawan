trigger saloniContact on Contact (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        saloniCountHelper.countMethod(Trigger.new);
    }

}