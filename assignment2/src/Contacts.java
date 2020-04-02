
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author thaycacac
 */
@XmlRootElement
public class Contacts {

    List<Contact> contacts;

    public Contacts() {
    }

    public Contacts(List<Contact> contacts) {
        this.contacts = contacts;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    @XmlElement(name = "contact")
    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }
}
