/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staxiteratordemo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventFactory;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.EndDocument;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartDocument;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

/**
 *
 * @author KienLT
 */
public class StAXIteratorDemo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        List<Project> list = readXML(new File("projects.xml"));
        for (Project p : list) {
            System.out.println(p);
        }

        Task t1 = new Task("Tạo module A", "06/03/2020", "08/03/2020", "hour", 16);
        Task t2 = new Task("Tạo module B", "08/03/2020", "10/03/2020", "hour", 16);
        Project project = new Project("100201", "Xây dựng phần mềm thư viện",
                "ĐH FPT", "05/03/2020", "05/04/2020");
        project.getTasks().add(t1);
        project.getTasks().add(t2);
        list.add(project);
        writeXML(list, new File("projects.xml"));

    }

    public static List<Project> readXML(File f) {
        List<Project> projects = new ArrayList<>();
        Project project = new Project();
        Task task = new Task();
        boolean atTask = false;
        try {
            XMLInputFactory factory = XMLInputFactory.newFactory();
            XMLEventReader reader = factory.createXMLEventReader(
                    new FileInputStream(f));
            while (reader.hasNext()) {
                XMLEvent event = reader.nextEvent();
                if (event.isStartElement()) {
                    StartElement start = event.asStartElement();
                    if (start.getName().toString().equals("projects")) {
                        projects = new ArrayList<>();
                    }
                    if (start.getName().toString().equals("project")) {
                        project = new Project();
                        Attribute id = start.getAttributeByName(new QName("id"));
                        project.setId(id.getValue());
                    }
                    if (start.getName().toString().equals("name") && !atTask) {
                        project.setName(reader.getElementText());
                    }
                    if (start.getName().toString().equals("customer")) {
                        event = reader.nextEvent();
                        Characters customer = event.asCharacters();
                        project.setCustomer(customer.getData());
                    }
                    if (start.getName().toString().equals("startdate") && !atTask) {
                        event = reader.nextEvent();
                        Characters startdate = event.asCharacters();
                        project.setStartdate(startdate.getData());
                    }
                    if (start.getName().toString().equals("enddate") && !atTask) {
                        event = reader.nextEvent();
                        Characters enddate = event.asCharacters();
                        project.setEnddate(enddate.getData());
                    }
                    if (start.getName().toString().equals("task")) {
                        task = new Task();
                        atTask = true;
                    }
                    if (start.getName().toString().equals("name") && atTask) {
                        event = reader.nextEvent();
                        Characters name = event.asCharacters();
                        task.setName(name.getData());
                    }
                    if (start.getName().toString().equals("startdate") && atTask) {
                        event = reader.nextEvent();
                        Characters startdate = event.asCharacters();
                        task.setStartdate(startdate.getData());
                    }
                    if (start.getName().toString().equals("enddate") && atTask) {
                        event = reader.nextEvent();
                        Characters enddate = event.asCharacters();
                        task.setEnddate(enddate.getData());
                    }
                    if (start.getName().toString().equals("time")) {
                        Attribute unit = start.getAttributeByName(new QName("unit"));
                        task.setTimeUnit(unit.getValue());
                        event = reader.nextEvent();
                        Characters time = event.asCharacters();
                        task.setTime(Integer.parseInt(time.getData()));
                    }
                }
                if (event.isEndElement()) {
                    EndElement end = event.asEndElement();
                    if (end.getName().toString().equals("task")) {
                        project.getTasks().add(task);
                        atTask = false;
                    }
                    if (end.getName().toString().equals("project")) {
                        projects.add(project);
                    }
                }
            }
        } catch (XMLStreamException ex) {
            Logger.getLogger(StAXIteratorDemo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(StAXIteratorDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return projects;
    }

    public static void writeXML(List<Project> list, File f) {
        try {
            XMLEventFactory ef = XMLEventFactory.newFactory();
            XMLOutputFactory factory = XMLOutputFactory.newFactory();
            XMLEventWriter writer = factory.createXMLEventWriter(new FileOutputStream(f));

            StartDocument sDoc = ef.createStartDocument("UTF-8", "1.0");
            writer.add(sDoc);
            StartElement sRoot = ef.createStartElement("", "", "projects");
            writer.add(sRoot);

            for (Project p : list) {
                StartElement sP = ef.createStartElement("", "", "project");
                writer.add(sP);
                Attribute id = ef.createAttribute("id", p.getId());
                writer.add(id);
                StartElement sName = ef.createStartElement("", "", "name");
                writer.add(sName);
                Characters name = ef.createCharacters(p.getName());
                writer.add(name);
                EndElement eName = ef.createEndElement("", "", "name");
                writer.add(eName);

                StartElement sC = ef.createStartElement("", "", "customer");
                writer.add(sC);
                Characters cust = ef.createCharacters(p.getCustomer());
                writer.add(cust);
                EndElement eC = ef.createEndElement("", "", "customer");
                writer.add(eC);

                StartElement sSD = ef.createStartElement("", "", "startdate");
                writer.add(sSD);
                Characters sd = ef.createCharacters(p.getStartdate());
                writer.add(sd);
                EndElement eSD = ef.createEndElement("", "", "startdate");
                writer.add(eSD);

                StartElement sEndDate = ef.createStartElement("", "", "enddate");
                writer.add(sEndDate);
                Characters enddate = ef.createCharacters(p.getEnddate());
                writer.add(enddate);
                EndElement eEndDate = ef.createEndElement("", "", "enddate");
                writer.add(eEndDate);

                for (Task task : p.getTasks()) {
                    StartElement sTask = ef.createStartElement("", "", "task");
                    writer.add(sTask);

                    StartElement sTName = ef.createStartElement("", "", "name");
                    writer.add(sTName);
                    Characters tname = ef.createCharacters(task.getName());
                    writer.add(tname);
                    EndElement eTName = ef.createEndElement("", "", "name");
                    writer.add(eTName);

                    StartElement sTSD = ef.createStartElement("", "", "startdate");
                    writer.add(sTSD);
                    Characters sTd = ef.createCharacters(task.getStartdate());
                    writer.add(sTd);
                    EndElement eTSD = ef.createEndElement("", "", "startdate");
                    writer.add(eTSD);

                    StartElement sTEndDate = ef.createStartElement("", "", "enddate");
                    writer.add(sTEndDate);
                    Characters tenddate = ef.createCharacters(task.getEnddate());
                    writer.add(tenddate);
                    EndElement eTEndDate = ef.createEndElement("", "", "enddate");
                    writer.add(eTEndDate);

                    StartElement sTime = ef.createStartElement("", "", "time");
                    writer.add(sTime);
                    Attribute unit = ef.createAttribute("unit", task.getTimeUnit());
                    writer.add(unit);
                    Characters time = ef.createCharacters(String.valueOf(task.getTime()));
                    writer.add(time);
                    EndElement eTime = ef.createEndElement("", "", "time");
                    writer.add(eTime);

                    EndElement eTask = ef.createEndElement("", "", "task");
                    writer.add(eTask);
                }

                EndElement eP = ef.createEndElement("", "", "project");
                writer.add(eP);
            }

            EndElement eRoot = ef.createEndElement("", "", "projects");
            writer.add(eRoot);
            EndDocument eDoc = ef.createEndDocument();
            writer.add(eDoc);
            writer.flush();
            writer.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(StAXIteratorDemo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (XMLStreamException ex) {
            Logger.getLogger(StAXIteratorDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
