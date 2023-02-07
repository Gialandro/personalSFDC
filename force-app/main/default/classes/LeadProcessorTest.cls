@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> lds = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            lds.add(
                new Lead(
                    Company = 'Cmp' + i,
                    LastName = 'lst' + i,
                    Status = 'Open',
                    LeadSource = 'Other',
                    Codigo_Postal__c = 12345,
                	Calle__c = 'Street')
            );
        }
        insert lds;
    }

    static testMethod void test() {        
        Test.startTest();
        LeadProcessor ldp = new LeadProcessor();
        Id batchId = Database.executeBatch(ldp);
        Test.stopTest();
    }
    
}