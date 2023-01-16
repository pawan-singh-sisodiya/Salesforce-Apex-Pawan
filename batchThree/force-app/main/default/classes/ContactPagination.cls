public class ContactPagination {

    
    public List<Contact> lstContact;
    Public Integer noOfRecords {get;set;}
    Public Integer size {get;set;}
    public String searchString{get;set;}
    
    
    public ContactPagination(){
        lstContact = new List<Contact>();
        size = 10;
    }
    
    public ApexPages.StandardSetController ssc{
        get{
        	if(ssc == null){
            	String queryResult = 'SELECT Id, Name, Phone FROM Contact ORDER BY Name';
            	ssc = new ApexPages.StandardSetController(Database.getQueryLocator(queryResult));
            	ssc.setPageSize(size);
            	noOfRecords = ssc.getResultSize();
            }
            return ssc;
        }
        set;
    }
    
    public List<Contact> getContacts(){
        return (List<Contact>)ssc.getRecords();
    }

   
}