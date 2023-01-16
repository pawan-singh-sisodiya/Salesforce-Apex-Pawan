public class AccountDetailComponentController {
    public List<Account> listOfAccountRecords{get;set;}
    
    public AccountDetailComponentController(){
         listOfAccountRecords = new List<Account>();
         for(Account accountRecord : [SELECT Id, Name, Type, Phone, AccountNumber, AnnualRevenue 
                                     FROM Account]){
              
                  listOfAccountRecords.add(accountRecord);               
              
         }
    }

}