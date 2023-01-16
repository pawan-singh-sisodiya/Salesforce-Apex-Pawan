trigger AccountTriggerAs1 on Account (after insert, after update) {

        if(Trigger.isInsert || Trigger.isUpdate){
            AccountTriggerAs1.updateRelatedOppPhone(Trigger.new, Trigger.oldMap);
        }
    
}