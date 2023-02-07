@isTest
public class TestRestrictContactByName {
    @isTest static void TestTrigger(){
        Contact cont = new Contact(LastName = 'INVALIDNAME');
        try {
            Test.startTest();
                Database.insert(cont);
            Test.stopTest();
        } catch(Exception e) {
            
        }
    }
}