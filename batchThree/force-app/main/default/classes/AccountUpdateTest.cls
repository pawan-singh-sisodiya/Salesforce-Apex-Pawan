@isTest
public class AccountUpdateTest {
    @TestSetup
    static void dataCoverage() {
        
        List<Account> accList1 = new List<Account>();
        
        Account acc = new Account();
        acc.Name = 'Blank';
        INSERT acc;
        List<Opportunity> oppList1 = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Type - Blank';
        opp1.AccountId = acc.Id;
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = system.today();
        opp1.Discount_Percent__c = 23;
        oppList1.add(opp1);
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Type - Reseller';
        opp2.AccountId = acc.Id;
        opp2.StageName = 'Prospecting';
        opp2.CloseDate = system.today();
        opp2.Discount_Percent__c = 23;
        oppList1.add(opp2);
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Type - Buyer';
        opp3.AccountId = acc.Id;
        opp3.StageName = 'Prospecting';
        opp3.CloseDate = system.today();
        opp3.Discount_Percent__c = 23;
        oppList1.add(opp3);
        
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Type - Current Customer';
        opp4.AccountId = acc.Id;
        opp4.StageName = 'Prospecting';
        opp4.CloseDate = system.today();
        opp4.Discount_Percent__c = 23;
        oppList1.add(opp4);
        insert oppList1;
        UPDATE acc;
        
        acc.Name = 'Reseller';
        acc.Account_Type__c = 'Reseller';
        UPDATE acc;
        
        acc.Name = 'Buyer';
        acc.Account_Type__c = 'Buyer';
        UPDATE acc;
        
        acc.Name = 'Current Customer';
        acc.Account_Type__c = 'Current Customer';
        UPDATE acc;
        
        
        acc.Account_Type__c = null;
        update acc;
        
    }
    
    @isTest
    public static void functinality() {
    }
}