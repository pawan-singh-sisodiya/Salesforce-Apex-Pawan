public class AccountTriggerAs1 {
    
    public static void updateRelatedOppPhone(List<Account> newList, Map<Id, Account> oldMap){
        Set<Id> ids = new Set<Id>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        for(Account acc : newList){
            if(oldMap != null && acc.Account_Type__c != oldMap.get(acc.Id).Account_Type__c){
                ids.add(acc.Id);
            }
        }
        if(ids.size() > 0){
            accountMethod(ids);
        }
    }
        public static void accountMethod(Set<Id> ids){
            List<Opportunity> oppRecords = [SELECT Id, Stage_Type__c, AccountId, Account.Account_Type__c FROM Opportunity WHERE AccountId IN : ids];    
            for(Opportunity oppr : oppRecords){
                if(oppr.Account.Account_Type__c == Null){
                    oppr.Stage_Type__c = '0';
                }
                else if(oppr.Account.Account_Type__c == 'Reseller'){
                     oppr.Stage_Type__c = '10';
                }
                else if(oppr.Account.Account_Type__c == 'Buyer'){
                     oppr.Stage_Type__c = '25';
                }
                else if(oppr.Account.Account_Type__c == 'Current Customer'){
                     oppr.Stage_Type__c = '100';
                }
            }
            update oppRecords;
            
        }
      
  
}