/**
 * @description       : 
 * @author            : erik.romero@globant.com
 * @group             : 
 * @last modified on  : 12-14-2022
 * @last modified by  : erik.romero@globant.com
**/
public class CountryCodeHelper {
	public static String getCountryCode(String country) {
		// ? Previous version: 
		// Country_Code__mdt countryCode = [
		// 		SELECT Id, MasterLabel, Country_Code__c
		// 		FROM Country_Code__mdt
		// 		WHERE MasterLabel = :country
		// 		LIMIT 1
		// 	];
		// return countryCode.Country_Code__c;
		// * Optimization:
		Country_Code__mdt code = Country_Code__mdt.getInstance (country);
		return code.Country_Code__c;
	}
}