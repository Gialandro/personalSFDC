/**
 * @description       : Class for https://trailhead.salesforce.com/es-MX/content/learn/modules/apex_patterns_sl/apex_patterns_sl_apply_sl_principles
 * @author            : gialandros@gmail.com
 * @last modified on  : 06/09/2021
 * @last modified by  : gialandros@gmail.com
**/
@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
	@HttpPost
	global static void closeCase (String reason) {
		RestRequest req = RestContext.request;
		String[] uriParts = req.requestURI.split('/');
		Id caseId = uriParts[2];
		CaseService.closeCases (new Set<Id> {caseId}, reason);
	}
}