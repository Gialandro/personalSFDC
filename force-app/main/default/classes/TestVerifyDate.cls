@isTest
private class TestVerifyDate {
    @isTest static void TestDate30(){
        Date fecha = Date.today();
        Date twoDates = VerifyDate.CheckDates(fecha,fecha+30);
    }
    
    @isTest static void TestDate15(){
        Date fecha = Date.today();
        Date twoDates = VerifyDate.CheckDates(fecha,fecha+15);
    }
}