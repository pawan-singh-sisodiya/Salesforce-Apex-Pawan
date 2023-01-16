trigger UniqueCourseNameTrigger on Course__c (before insert) {

    if(trigger.isBefore){
        UniqueCourseNameHandler.uniqueName(trigger.new);
    }
}