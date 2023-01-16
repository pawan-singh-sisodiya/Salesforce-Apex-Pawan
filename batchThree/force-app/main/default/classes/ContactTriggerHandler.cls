public class ContactTriggerHandler {

    public static void test(List<Contact> newContact){
        for(Contact con : newContact){
            if(con.Birthdate == null){
                con.addError('Please insert Birthdate');
            }
        }
    }
}