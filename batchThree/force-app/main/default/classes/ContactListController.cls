public class ContactListController {
    public String name{get;set;}
    public List<Contact> contactRecords{get;set;}
    public Boolean yes;
    public Boolean no;
    
    public ContactListController(){
        contactRecords = [SELECT Id, Name, FirstName, Phone, Email FROM Contact LIMIT 10];
        if(contactRecords.size() > 0){
             yes = true;
        }else{
            no = true;
        }
    }
    
    public void searchRecord(){
        String fName = '%'+ name + '%';      
        contactRecords = [SELECT Id, Name, FirstName, Phone, Email FROM Contact WHERE Name Like: fName];
    }
}