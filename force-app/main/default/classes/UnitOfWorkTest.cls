/**
 * @description       : Class for https://trailhead.salesforce.com/es-MX/content/learn/modules/apex_patterns_sl/apex_patterns_sl_apply_uow_principles
 * @author            : gialandros@gmail.com
 * @last modified on  : 06/09/2021
 * @last modified by  : gialandros@gmail.com
**/
@isTest
public with sharing class UnitOfWorkTest {
	@IsTest
	static void challengeComplete () {
		List<Account> accs = new List<Account>();
		List<Contact> cons = new List<Contact>();
		List<Note> notes = new List<Note>();
		fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork (new List<Schema.SObjectType> {Account.SObjectType, Contact.SObjectType, Note.SObjectType});
		for (Integer index = 0; index < 100; index++) {
			Account acc = new Account (Name = 'Account test ' + index);
			uow.registerNew (acc);
			for (Integer innerIndex = 0; innerIndex < 5; innerIndex++) {
				Contact con = new Contact(LastName = 'LastName ' + innerIndex);
				uow.registerNew (con, Contact.AccountId, acc);
				Note nt = new Note(Title = 'Title ' + innerIndex);
				uow.registerNew (nt, Note.ParentId, acc);
			}
		}
		uow.commitWork();
		Test.startTest();
		Test.stopTest();
		System.assertEquals(100, [Select Id from Account].size());
		System.assertEquals(500, [Select Id from Contact].size());
		System.assertEquals(500, [Select Id from Note].size());
	}
}