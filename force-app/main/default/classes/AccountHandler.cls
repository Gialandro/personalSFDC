/**
 * @description       : 
 * @author            : gialandros@gmail.com
 * @last modified on  : 08/02/2023
 * @last modified by  : gialandros@gmail.com
**/
public class AccountHandler {
    public static Account insertNewAccount (String val) {
        Account acc = New Account (Name = val);
        try {
            insert acc;
        } catch(DMLException er) {
            system.debug('Error: ' + er.getMessage());
            return null;
        }
		System.debug ('test');
        return acc;
    }
}