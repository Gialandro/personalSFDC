@isTest
private class DailyLeadProcessorTest {
    public static String cron = '0 0 0 8 6 ? 2033';
    static testMethod void testLeadProcessor() {
        List<Lead> lds = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            Lead ld = new Lead(
            					Company = 'Cmp' + i,
			                    LastName = 'lst' + i,
            			        Status = 'Open',
            			        LeadSource = '',
			                    Codigo_Postal__c = 12345,
			                	Calle__c = 'Street');
            lds.add(ld);
        }
        insert lds;
        
        test.startTest();
        	String jbId = System.Schedule('testSchedule', cron, new DailyLeadProcessor());
        test.stopTest();
    }
}