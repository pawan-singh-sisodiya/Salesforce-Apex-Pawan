public class CustomControllerDemo {
    
    public Contact con{get;set;}
    
    public CustomControllerDemo(){
        con = new Contact();
    }
    
    public void save(){
        INSERT con;
         con = new Contact();
    }
}