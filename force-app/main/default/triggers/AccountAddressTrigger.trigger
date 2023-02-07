trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account test: Trigger.new){
        if(test.Match_Billing_Address__c == true && test.BillingPostalCode != null){
        test.ShippingPostalCode = test.BillingPostalCode;
    }
    }
}