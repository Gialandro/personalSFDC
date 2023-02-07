trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tsks = new List<Task>();
    for(Order_Event__e oe: Trigger.New) {
        if(oe.Has_Shipped__c == True) {
            Task ts = new Task(
            	Priority = 'Medium',
            	Status = 'New',
            	Subject = 'Follow up on shipped order ' + oe.Order_Number__c,
            	OwnerId = UserInfo.getUserId());
            tsks.add(ts);
        }
    }
    insert tsks;
}