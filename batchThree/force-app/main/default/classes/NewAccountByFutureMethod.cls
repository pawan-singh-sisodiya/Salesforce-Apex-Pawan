public class NewAccountByFutureMethod {

    public NewAccountByFutureMethod(){
        accountMethod();
    }
    @future
    public static void accountMethod(){
        Account acc = new Account(Name = 'Account created by Future Method');
        INSERT acc;
        System.debug('@@@Account Id'+ acc.Id);
    }
}