

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author thaycacac
 */
@XmlRootElement
@XmlType(propOrder = {"mobile", "home", "office"})
public class Phone {

    private String mobile;
    private String home;
    private String office;

    public Phone() {
    }

    public Phone(String mobile, String home, String office) {
        this.mobile = mobile;
        this.home = home;
        this.office = office;
    }

    public String getMobile() {
        return mobile;
    }

    @XmlElement
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getHome() {
        return home;
    }

    @XmlElement
    public void setHome(String home) {
        this.home = home;
    }

    public String getOffice() {
        return office;
    }

    @XmlElement
    public void setOffice(String office) {
        this.office = office;
    }

    @Override
    public String toString() {
        return this.home + " " + this.office + " " + this.mobile;
    }

    
}
