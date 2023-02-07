@isTest
private class AccountProcessorTest {
    static testMethod void overAll() {
        List<Account> accts = new List<Account>();
        List<Id> ids = new List<Id>();
        for(Integer i=0; i<7; i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        List<Contact> cons = new List<Contact>();
        for (Integer j=0;j<7;j++) {
            Account acct = accts[j];
            ids.add(accts[j].Id);
            for (Integer k=2*j; k<2*(j+1); k++) {
                cons.add(new Contact(firstname='Test'+k,
                                     lastname='Test'+k,
                                     AccountId=acct.Id));
            }
        }
        insert cons;
        Test.startTest();
        	AccountProcessor.countContacts(ids);
        Test.stopTest();
    }
}