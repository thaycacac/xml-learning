/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staxcursordemo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KienLT
 */
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

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", name=" + name + ", customer=" + customer + ", startdate=" + startdate + ", enddate=" + enddate + ", tasks=" + tasks + '}';
    }

}
