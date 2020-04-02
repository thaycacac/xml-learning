/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staxcursordemo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;

/**
 *
 * @author KienLT
 */
public class StAXCursorDemo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        List<Project> list = readXML(new File("projects.xml"));
        for (Project project : list) {
            System.out.println(project);
        }
        
        Project project = new Project("120121", "Phần mềm điểm danh", "ĐH FPT", "08/03/2020", "08/05/2020");
        project.getTasks().add(new Task("Phân tích", "08/03/2020", "20/03/2020", "day", 10));
        project.getTasks().add(new Task("Thiết kế", "20/03/2020", "20/04/2020", "day", 22));
        project.getTasks().add(new Task("Coding", "01/04/2020", "15/05/2020", "day", 25));
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
            XMLStreamReader reader = factory.createXMLStreamReader(
                    new FileInputStream(f));
            while (reader.hasNext()) {
                int pointer = reader.next();
                if (pointer == XMLStreamReader.START_ELEMENT) {
                    String open_tag_name = reader.getName().toString();
                    if (open_tag_name.equals("projects")) {
                        projects = new ArrayList<>();
                    }
                    if (open_tag_name.equals("project")) {
                        project = new Project();
                        project.setId(reader.getAttributeValue("", "id"));
                    }
                    if (open_tag_name.equals("name") && !atTask) {
                        project.setName(reader.getElementText());
                    }
                    if (open_tag_name.equals("customer")) {
                        project.setCustomer(reader.getElementText());
                    }
                    if (open_tag_name.equals("startdate") && !atTask) {
                        project.setStartdate(reader.getElementText());
                    }
                    if (open_tag_name.equals("enddate") && !atTask) {
                        project.setEnddate(reader.getElementText());
                    }
                    if (open_tag_name.equals("task")) {
                        task = new Task();
                        atTask = true;
                    }
                    if (open_tag_name.equals("name") && atTask) {
                        task.setName(reader.getElementText());
                    }
                    if (open_tag_name.equals("startdate") && atTask) {
                        task.setStartdate(reader.getElementText());
                    }
                    if (open_tag_name.equals("enddate") && atTask) {
                        task.setEnddate(reader.getElementText());
                    }
                    if (open_tag_name.equals("time")) {
                        task.setTimeUnit(reader.getAttributeValue("", "unit"));
                        task.setTime(Integer.parseInt(reader.getElementText()));
                    }
                }
                if (reader.isEndElement()) {
                    String close_tag_name = reader.getName().toString();
                    if (close_tag_name.equals("task")) {
                        atTask = false;
                        project.getTasks().add(task);
                    }
                    if (close_tag_name.equals("project")) {
                        projects.add(project);
                    }
                }
            }
        } catch (FileNotFoundException | XMLStreamException ex) {
            Logger.getLogger(StAXCursorDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return projects;
    }

    public static void writeXML(List<Project> list, File f) {
        try {
            XMLOutputFactory factory = XMLOutputFactory.newFactory();
            XMLStreamWriter writer = factory.createXMLStreamWriter(
                    new FileOutputStream(f));
            writer.writeStartDocument("UTF-8", "1.0");
            writer.writeStartElement("projects");
            for (Project project : list) {
                writer.writeStartElement("project");
                writer.writeAttribute("id", project.getId());
                writer.writeStartElement("name");
                writer.writeCharacters(project.getName());
                writer.writeEndElement();
                writer.writeStartElement("customer");
                writer.writeCharacters(project.getCustomer());
                writer.writeEndElement();
                writer.writeStartElement("startdate");
                writer.writeCharacters(project.getStartdate());
                writer.writeEndElement();
                writer.writeStartElement("enddate");
                writer.writeCharacters(project.getEnddate());
                writer.writeEndElement();
                for (Task task : project.getTasks()) {
                    writer.writeStartElement("task");
                    writer.writeStartElement("name");
                    writer.writeCharacters(task.getName());
                    writer.writeEndElement();
                    writer.writeStartElement("startdate");
                    writer.writeCharacters(task.getStartdate());
                    writer.writeEndElement();
                    writer.writeStartElement("enddate");
                    writer.writeCharacters(task.getEnddate());
                    writer.writeEndElement();
                    writer.writeStartElement("time");
                    writer.writeAttribute("unit", task.getTimeUnit());
                    writer.writeCharacters(String.valueOf(task.getTime()));
                    writer.writeEndElement();
                    writer.writeEndElement();
                }
                writer.writeEndElement();
            }
            writer.writeEndElement();
            writer.writeEndDocument();
            writer.flush();
            writer.close();
        } catch (FileNotFoundException | XMLStreamException ex) {
            Logger.getLogger(StAXCursorDemo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
