
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.xml.stream.XMLEventFactory;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.EndDocument;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartDocument;
import javax.xml.stream.events.StartElement;

/**
 *
 * @author thaycacac
 */
public class StAXIterator {
    
    public void writeXML(List<Contact> list, File f) {
        try {
            XMLEventFactory ef = XMLEventFactory.newFactory();
            XMLOutputFactory factory = XMLOutputFactory.newFactory();
            XMLEventWriter writer = factory.createXMLEventWriter(new FileOutputStream(f));
            
            StartDocument sDoc = ef.createStartDocument("UTF-8", "1.0");
            writer.add(sDoc);
            StartElement sRoot = ef.createStartElement("", "", "contacts");
            writer.add(sRoot);
            
            for (Contact contact : list) {
                StartElement sP = ef.createStartElement("", "", "contact");
                writer.add(sP);
                Attribute id = ef.createAttribute("id", String.valueOf(contact.getId()));
                writer.add(id);
                StartElement sName = ef.createStartElement("", "", "name");
                writer.add(sName);
                Characters name = ef.createCharacters(contact.getName());
                writer.add(name);
                EndElement eName = ef.createEndElement("", "", "name");
                writer.add(eName);
                StartElement sC = ef.createStartElement("", "", "company");
                writer.add(sC);
                Characters cust = ef.createCharacters(contact.getCompany());
                writer.add(cust);
                EndElement eC = ef.createEndElement("", "", "customer");
                writer.add(eC);
                
                StartElement sSD = ef.createStartElement("", "", "email");
                writer.add(sSD);
                Characters sd = ef.createCharacters(contact.getEmail());
                writer.add(sd);
                EndElement eSD = ef.createEndElement("", "", "email");
                writer.add(eSD);
                
                StartElement sTask = ef.createStartElement("", "", "phone");
                writer.add(sTask);
                
                StartElement sTName = ef.createStartElement("", "", "mobile");
                writer.add(sTName);
                Characters tname = ef.createCharacters(contact.getPhone().getMobile());
                writer.add(tname);
                EndElement eTName = ef.createEndElement("", "", "mobile");
                writer.add(eTName);
                
                StartElement sTSD = ef.createStartElement("", "", "home");
                writer.add(sTSD);
                Characters sTd = ef.createCharacters(contact.getPhone().getHome());
                writer.add(sTd);
                EndElement eTSD = ef.createEndElement("", "", "home");
                writer.add(eTSD);
                
                StartElement sTEndDate = ef.createStartElement("", "", "office");
                writer.add(sTEndDate);
                Characters tenddate = ef.createCharacters(contact.getPhone().getOffice());
                writer.add(tenddate);
                EndElement eTEndDate = ef.createEndElement("", "", "office");
                writer.add(eTEndDate);
                
                EndElement eTask = ef.createEndElement("", "", "phone");
                writer.add(eTask);
                
                EndElement eP = ef.createEndElement("", "", "project");
                writer.add(eP);
            }
            
            EndElement eRoot = ef.createEndElement("", "", "projects");
            writer.add(eRoot);
            EndDocument eDoc = ef.createEndDocument();
            writer.add(eDoc);
            writer.flush();
            writer.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
