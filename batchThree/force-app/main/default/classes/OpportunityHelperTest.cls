@isTest
public class OpportunityHelperTest {
    
    static AS1TriggerHandler as1 = new AS1TriggerHandler();
    
    @testSetup
    static void opMethod(){
        Account accRec = new Account();
        accRec.Name = 'Acc1';
        accRec.Date__c = System.today();
        INSERT accRec;
        
        Account accRec2 = new Account();
        accRec2.Name = 'Acc2';
        accRec2.Account_Type__c = 'Reseller';
        accRec2.Date__c = System.today();
        INSERT accRec2;
        
        Account accRec3 = new Account();
        accRec3.Name = 'Acc1';
        accRec3.Account_Type__c = 'Buyer';
        accRec3.Date__c = System.today();
        INSERT accRec3;
        
        Account accRec4 = new Account();
        accRec4.Name = 'Acc2';
        accRec4.Account_Type__c = 'Current Customer';
        accRec4.Date__c = System.today();
        INSERT accRec4;
        
        Opportunity oppRec = new Opportunity();
        oppRec.Name = 'opp1';
        oppRec.AccountId = accRec.Id;
        oppRec.StageName = 'Qualification';
        oppRec.Amount = 2323;
        oppRec.CloseDate = System.today();
        oppRec.Discount_Percent__c = 20;
        INSERT oppRec;
        
        Opportunity oppRec2 = new Opportunity();
        oppRec2.Name = 'opp2';
        oppRec2.AccountId = accRec2.Id;
        oppRec2.StageName = 'Prospecting';
        oppRec2.Amount = 2322;
        oppRec2.CloseDate = System.today();
        oppRec2.Discount_Percent__c = 22;
        INSERT oppRec2;
        
        Opportunity oppRec3 = new Opportunity();
        oppRec3.Name = 'opp3';
        oppRec3.AccountId = accRec3.Id;
        oppRec3.StageName = 'Qualification';
        oppRec3.Amount = 2323;
        oppRec3.CloseDate = System.today();
        oppRec3.Discount_Percent__c = 20;
        INSERT oppRec3;
        
        Opportunity oppRec4 = new Opportunity();
        oppRec4.Name = 'opp4';
        oppRec4.AccountId = accRec4.Id;
        oppRec4.StageName = 'Prospecting';
        oppRec4.Amount = 2322;
        oppRec4.CloseDate = System.today();
        oppRec4.Discount_Percent__c = 22;
        INSERT oppRec4;
    }
    
    @isTest
    public static void coverdOpportunity(){
        
        set<String> accId = new Set<String>();
        for(Account ac : [SELECT Id, Name, Date__c FROM Account]){
            accId.add(ac.id);
        }
        List<Opportunity> opportunityRecords = [SELECT Id, Name, StageName, Amount, AccountId, CloseDate, Discount_Percent__c, Account.Account_Type__c FROM Opportunity WHERE id IN : accId];
        For(Opportunity opp : opportunityRecords){
            if(opp.AccountId != null){
                System.assertEquals(true, opportunityRecords.size() > 0);
                AS1TriggerHandler opprtunityList = new AS1TriggerHandler();
                
               if(opp.Account.Account_Type__c == null){
                    opp.Stage_Type__c = '0';
                }
                else 
                    if(opp.Account.Account_Type__c == 'Reseller'){
                      opp.Stage_Type__c = '10';
                    }
                else 
                    if(opp.Account.Account_Type__c == 'Buyer'){
                       opp.Stage_Type__c = '25';
                    }
                else 
                    if(opp.Account.Account_Type__c == 'Current Customer'){
                        opp.Stage_Type__c = '100';
                    }
            }
        }
    }
}