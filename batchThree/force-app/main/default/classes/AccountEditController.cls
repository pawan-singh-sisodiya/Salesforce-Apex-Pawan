public class AccountEditController {

    accountwrapper1 makeEdit;
    List<accountwrapper1> listAccount = new List<accountwrapper1>();
    List<Account> selectableAccount = new List<Account>();
    List<Account> selectableAccount2 = new List<Account>();
    public Boolean showPopup { get; set; }

   public AccountEditController() {
          showPopup = False;
   }

    public List<accountwrapper1> getAccounts() {
            for(Account a: [SELECT Id, Name, BillingCountry, Phone FROM Account])
            listAccount.add(new accountwrapper1(a));
            return listAccount;            
    }

     public PageReference showToPopup() {
        showPopUp = True;
         selectableAccount.clear();
        for(accountwrapper1 accwrapper : listAccount)
        if(accwrapper.selected == True)
        selectableAccount.add(accwrapper.acc);
        system.debug(selectableAccount);
        return Null;
    }

    public string BillingCountry {
        get; 
        set;
    }


    public PageReference Savemeth() {
        for(account acc :selectableAccount ) {
                acc.BillingCountry = BillingCountry;
                  selectableAccount2.add(acc);
        }    
    update selectableAccount2;
    return Null;

    }

    public PageReference cancelmeth() {        
        return Null;
    }

    public PageReference closePopup() {
        showPopup = False;    
        return Null;
    }

    public PageReference GetSelectedAccounts()
    {
       if(selectableAccount.size()>0) {
        system.debug(selectableAccount.size());
        system.debug(selectableAccount);
       return Null;
        }
        else
        return Null;
    } 


     public class accountwrapper1
    {             
        public Account acc{get; set;}      
        public Boolean selected {get; set;}
        public accountwrapper1(Account a)
        {
            acc = a;
            selected = False;
        }
    }
}