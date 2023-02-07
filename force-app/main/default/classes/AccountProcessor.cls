public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<Id> accRecords) {
        List<Account> idsUp = new List<Account>();
        for(Account ac: [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN: accRecords]) {
            ac.Number_of_Contacts__c = 0;
            for(Contact ct: [SELECT AccountId FROM Contact WHERE AccountId IN: accRecords]) {
                if(ct.AccountId == ac.Id) {
                    ac.Number_of_Contacts__c = ac.Number_of_Contacts__c + 1;
                }
        	}
            idsUp.add(ac);
        }
        Database.update(idsUp, false);
    }
}