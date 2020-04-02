/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jaxbparserdemo;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author KienLT
 */
@XmlRootElement
@XmlType(propOrder = {"name", "customer", "startdate", "enddate", "tasks"})
public class Project {

    private String id;
    private String name;
    private String customer;
    private String startdate;
    private String enddate;
    private List<Task> tasks;

    public Project() {
        tasks = new ArrayList<>();
    }

    public Project(String id, String name, String customer, String startdate, String enddate) {
        this.id = id;
        this.name = name;
        this.customer = customer;
        this.startdate = startdate;
        this.enddate = enddate;
        this.tasks = new ArrayList<>();
    }

    public Project(String id, String name, String customer, String startdate, String enddate, List<Task> tasks) {
        this.id = id;
        this.name = name;
        this.customer = customer;
        this.startdate = startdate;
        this.enddate = enddate;
        this.tasks = tasks;
    }

    public String getId() {
        return id;
    }

    @XmlAttribute
    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    @XmlElement
    public void setName(String name) {
        this.name = name;
    }

    public String getCustomer() {
        return customer;
    }

    @XmlElement
    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getStartdate() {
        return startdate;
    }

    @XmlElement
    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    @XmlElement
    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    @XmlElement(name = "task")
    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", name=" + name + ", customer=" + customer + ", startdate=" + startdate + ", enddate=" + enddate + ", tasks=" + tasks + '}';
    }

}
