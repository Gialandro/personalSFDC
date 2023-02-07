@isTest
public class ParkLocatorTest {
    static testMethod void testSOAP() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String [] testStr = ParkLocator.country('India');
    }
}