public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer cant, String lName){
        List<Contact> gen = new List<Contact>();
        for(Integer row = 0; row < cant; row++){
            Contact rowToAdd = new Contact(FirstName = lName + row, LastName = lName);
            gen.add(rowToAdd);
        }
        return gen ;
    }
}