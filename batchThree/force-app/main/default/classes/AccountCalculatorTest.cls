@isTest
public class AccountCalculatorTest {
    
    @isTest
    public static void countContactTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i<250; i++){
            accList.add(New Account(Name = 'Test ' + i));
        }
        
        Insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        
        for(Account acc : accList){
            conList.add(New Contact(firstName = 'Test', lastName = acc.Name, AccountId = acc.Id));
            
            accIds.add(acc.Id);
        }
        
        Insert conList;
    }

}