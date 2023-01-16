trigger ContactCountOnAccount on Contact (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        ContactCountOnAccountHelper.countInsertMethod(Trigger.new);
    }
}