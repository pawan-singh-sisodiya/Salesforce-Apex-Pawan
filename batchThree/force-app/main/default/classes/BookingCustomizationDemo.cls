public class BookingCustomizationDemo {

    public Booking__c book{get;set;}
    public Booking__c book2{get;set;}
    public Booking__c book3{get;set;}
    
    public BookingCustomizationDemo(){
        book =new Booking__c();
        book2 =new Booking__c();
        book3 =new Booking__c();
    }
    
    public void save(){
        INSERT book;
        INSERT book2;
        INSERT book3;
    }
}