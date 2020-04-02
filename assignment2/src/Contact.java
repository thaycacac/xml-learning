

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author thaycacac
 */
@XmlRootElement
@XmlType(propOrder = {"name", "company", "email", "phone"})
public class Contact {

    private int id;
    private String name;
    private String company;
    private String email;
    private Phone phone;

    public Contact() {
    }

    public Contact(int id, String name, String company, String email, Phone phone) {
        this.id = id;
        this.name = name;
        this.company = company;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    @XmlAttribute
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    @XmlElement
    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    @XmlElement
    public void setCompany(String company) {
        this.company = company;
    }

    public String getEmail() {
        return email;
    }

    @XmlElement
    public void setEmail(String email) {
        this.email = email;
    }

    public Phone getPhone() {
        return phone;
    }

    @XmlElement
    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return this.name + " " + this.company + " " + this.company + this.phone;
    }

}
