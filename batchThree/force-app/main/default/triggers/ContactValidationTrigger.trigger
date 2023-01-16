trigger ContactValidationTrigger on Contact (before insert) {
    
    if(trigger.isInsert){
        ContactValidation.validationBirthday(trigger.new);
    }
}