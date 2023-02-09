/**
 * @description       : 
 * @author            : gialandros@gmail.com
 * @last modified on  : 09/02/2023
 * @last modified by  : gialandros@gmail.com
**/
@RestResource(urlMapping='/Account/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT ID, Name FROM Contacts) FROM Account WHERE Id =: accId];
		System.debug ('Account=>>' + acc);
		System.debug ('test in master AGAIN D: Blood for the blood God!!');
        return acc;
    }
}