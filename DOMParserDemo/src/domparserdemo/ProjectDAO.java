/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domparserdemo;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author KienLT
 */
public class ProjectDAO {

    public static Element createProject(Document doc, Project p) {
        Element project = doc.createElement("project");
        project.setAttribute("id", p.getId());
        Element name = doc.createElement("name");
        name.setTextContent(p.getName());
        Element customer = doc.createElement("customer");
        customer.setTextContent(p.getCustomer());
        Element startdate = doc.createElement("startdate");
        startdate.setTextContent(p.getStartdate());
        Element enddate = doc.createElement("enddate");
        enddate.setTextContent(p.getEnddate());
        project.appendChild(name);
        project.appendChild(customer);
        project.appendChild(startdate);
        project.appendChild(enddate);
        for(Task t : p.getTasks()) {
            Element task = createTask(doc, t);
            project.appendChild(task);
        }        
        return project;
    }

    public static Element createTask(Document doc, Task task) {
        Element t = doc.createElement("task");
        Element name = doc.createElement("name");
        name.setTextContent(task.getName());
        Element startDate = doc.createElement("startdate");
        startDate.setTextContent(task.getStartdate());
        Element endDate = doc.createElement("enddate");
        endDate.setTextContent(task.getEnddate());
        Element time = doc.createElement("time");
        time.setTextContent(String.valueOf(task.getTime()));
        Attr unit = doc.createAttribute("unit");
        unit.setValue(task.getTimeUnit());
        time.setAttributeNode(unit);
        t.appendChild(name);
        t.appendChild(startDate);
        t.appendChild(endDate);
        t.appendChild(time);
        return t;
    }
}
