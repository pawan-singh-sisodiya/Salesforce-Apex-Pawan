public class AccountCalculator {
    
    @future
    public static void countContact(List<Id> accIds){
        List<Account> accList = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id =: accIds];
        
        for(Account acc : accList){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        
        if(!accList.isEmpty()){
            UPDATE accList;
        }
    }

}