/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jaxbparserdemo;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author KienLT
 */
public class JAXBParserDemo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here        
//        Project project = new Project("100100", "Xây dựng phần mềm thư viện", "ĐH FPT", "20/02/2020", "30/04/2020");
//        project.getTasks().add(new Task("Phân tích", "20/02/2020", "28/02/2020", 8));
//        project.getTasks().add(new Task("Thiết kế", "01/03/2020", "30/03/2020", 26));
//        project.getTasks().add(new Task("Phát triển", "01/04/2020", "30/04/2020", 26));
//        writeXML(project, new File("project.xml"));

          Project p = readXML(new File("project.xml"));
          System.out.println(p);

    }

    public static void writeXML(Project p, File f) {
        try {
            JAXBContext context = JAXBContext.newInstance(Project.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.marshal(p, f);
        } catch (JAXBException ex) {
            Logger.getLogger(JAXBParserDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Project readXML(File f) {
        try {
            JAXBContext context = JAXBContext.newInstance(Project.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            Project p = (Project) unmarshaller.unmarshal(f);
            return p;
        } catch (JAXBException ex) {
            Logger.getLogger(JAXBParserDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
