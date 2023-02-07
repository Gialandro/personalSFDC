@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> acts = new List<Account>();
        for(Integer i = 0; i<50; i++) {
            Account ac = new Account(Name = 'Test' + i, BillingState = 'NY');
            acts.add(ac);
            Account act = new Account(Name = 'Tst' + i, BillingState = 'CA');
            acts.add(act);
        }
        insert acts;
        Contact con = new Contact(FirstName = 'Fname', LastName = 'Lname', AccountId = acts[0].Id);
        insert con;
    }
    static testMethod void tstQue() {
        Contact ct = [SELECT Id, FirstName, LastName, AccountId FROM Contact LIMIT 1];
        System.debug('ct' + ct);
        AddPrimaryContact apc = new AddPrimaryContact(ct, 'NY');
        test.startTest();
        	System.enqueueJob(apc);
        test.stopTest();
    }
}