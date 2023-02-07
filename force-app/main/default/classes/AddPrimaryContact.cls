public class AddPrimaryContact implements Queueable {
    //private List<Contact> cts;
    private String stateAbr;
    private Contact contact;
    public AddPrimaryContact(Contact ct, String abr) {
        this.contact = ct;
        this.stateAbr = abr;
    }
    public void execute(QueueableContext context) {
        List<Account> accs = [SELECT Id FROM Account WHERE BillingState =: stateAbr LIMIT 200];
        List<Contact> cts = new List<Contact>();
        for(Account act: accs) {
            contact.AccountId = act.Id;
            cts.add(contact.clone());
        }
        insert cts;
    }
}