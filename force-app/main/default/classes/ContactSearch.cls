public class ContactSearch {
    public static List<Contact> searchForContacts (String one, String two) {
        List<Contact> Results = [SELECT Id, Name from Contact WHERE LastName=:one AND MailingPostalCode=:two];
        return Results;
    }
}