public class adconroller {
    
    public List<ContactWrapper> contactList{get;set;}
    public adconroller(){
        Integer index = 1;
        contactList = new List<ContactWrapper>();
        for(Contact con: [SELECT Id, Name, Email FROM Contact]){
            ContactWrapper wrapper = new ContactWrapper();
            wrapper.sNo = index;
            wrapper.contactName = con.Name;
            wrapper.email = con.Email;
            
            contactList.add(wrapper);
            index++;
        }
    }
    public class ContactWrapper{
        public Integer sNo{get;set;}
        public String contactName{get;set;}
        public String email{get;set;}
    }
}