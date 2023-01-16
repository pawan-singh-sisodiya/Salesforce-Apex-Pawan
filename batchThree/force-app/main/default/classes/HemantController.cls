public with sharing class HemantController {

    @AuraEnabled
    public static Account accountMethod(Account accName){
     INSERT accName;
     return accName;
    }
    @AuraEnabled
    public static Account contactCountMethod(Account accName){
     INSERT accName;
     return accName;
    }
}