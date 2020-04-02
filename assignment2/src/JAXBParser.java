

import java.io.File;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author thaycacac
 */
public class JAXBParser {

    public List<Contact> readXML(File f) {
        try {
            JAXBContext context = JAXBContext.newInstance(Contacts.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            Contacts contacts = (Contacts) unmarshaller.unmarshal(f);
            return contacts.getContacts();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
