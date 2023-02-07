/**
 * @description       : Class for https://trailhead.salesforce.com/es-MX/content/learn/modules/apex_patterns_sl/apex_patterns_sl_apply_sl_principles
 * @author            : gialandros@gmail.com
 * @last modified on  : 06/09/2021
 * @last modified by  : gialandros@gmail.com
**/
public with sharing class CaseService {
	private CaseService () {}

	public static void closeCases (Set<Id> caseIds, String closeReason) {
		if (caseIds == null || caseIds.size() == 0) {
			throw new CaseServiceException ('Cases not specified');
		}
		if (closeReason == null || closeReason == '') {
			throw new CaseServiceException ('Invalid Reason');
		}
		List<Case> cases = [SELECT Reason FROM Case WHERE Id IN: caseIds];
		List<Case> cases2Update = new List<Case>();
		for (Case cs: cases) {
			cs.Status = 'Closed';
			cs.Reason = closeReason;
			cases2Update.add (cs);
		}
		SavePoint sp = Database.SetSavePoint();
		try {
			update cases2Update;
		} catch (Exception e) {
			Database.rollback(sp);
			throw e;
		}
	}

	public class CaseServiceException extends Exception {}
}