@isTest
public class AnimalLocatorTest {
    static testMethod void testReq() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String tst = AnimalLocator.getAnimalNameById(1);
    }
}