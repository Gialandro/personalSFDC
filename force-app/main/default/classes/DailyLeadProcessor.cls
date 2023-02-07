global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ct) {
        List<Lead> lds = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> ldsUp = new List<Lead>();
        for(Lead ld: lds) {
            ld.LeadSource = 'Dreamforce';
            ldsUp.add(ld);
        }
        Database.update(ldsUp);
    }
}