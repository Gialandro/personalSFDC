public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String parametro){
        
        List<List<sObject>> searchList = [FIND :parametro IN NAME FIELDS
       RETURNING Lead(FirstName, LastName),Contact(FirstName,LastName)];
        return searchList;
    }
}