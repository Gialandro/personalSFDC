@isTest
public class AccountManagerTest {
    static testMethod void testRest() {
        Id recordId = testRecord();
        RestRequest request = new RestRequest();
        request.RequestURI = 'https://na50.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account acTest = AccountManager.getAccount();
    }
    static Id testRecord() {
        Account acc = new Account(
        	Name = 'fName');
        insert acc;
        Contact ct = new Contact(
        	LastName = 'lName',
        	AccountId = acc.Id);
        return acc.Id;
    }
}