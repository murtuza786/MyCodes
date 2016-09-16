public class ContactSearch {
 public static List<Contact> searchForContacts(string s1, string s2)
    {
        List<Contact> cont=[select id,Name from Contact where lastname=:s1 and MailingPostalCode=:s2];
       system.debug(cont);
        return cont;
        
    }
}