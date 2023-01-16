public class ContactValidation {

    public static void validationBirthday(List<Contact> newList){
        for(Contact con: newList){
            if(con.Birthdate == null){
                con.addError('Birthdate is Required');
            }
        }
    }
}