public class AccountController {
    
    @AuraEnabled
    public static List<Contact> getAccounts(){
        
        List<Contact> conRecords = [SELECT Id, Name, Account.Name FROM Contact];
        return conRecords;
    }

}