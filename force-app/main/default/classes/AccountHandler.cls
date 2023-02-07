public class AccountHandler {
    public static Account insertNewAccount (String val) {
        Account acc = New Account (Name = val);
        try {
            insert acc;
        } catch(DMLException er) {
            system.debug('Error: ' + er.getMessage());
            return null;
        }
        return acc;
    }
}