trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> CloWo = new List<Task>();
    for(Opportunity asd: [SELECT Id FROM Opportunity WHERE Id IN: Trigger.New AND StageName = 'Closed Won']){
        CloWo.add(new Task(whatID = asd.Id, Subject='Follow Up Test Task'));
    }
    insert CloWo;
}