global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> lds = new List<Lead>();
        for(Lead lead: scope) {
            lead.LeadSource = 'Dreamforce';
            lds.add(lead);
        }
        update lds;
    }
    global void finish(Database.BatchableContext bc) {}
}