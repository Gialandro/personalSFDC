global class SchedulerBatchInsertCP implements Schedulable {
	global void execute(SchedulableContext sc) {
		String query =  'SELECT Id,Name' + ' FROM CodigoPostal__c';
		Id batchInstanceId = Database.executeBatch(new BatchInsertCP(query),100);
	}
}