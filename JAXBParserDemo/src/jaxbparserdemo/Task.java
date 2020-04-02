/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jaxbparserdemo;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author KienLT
 */
@XmlRootElement
@XmlType(propOrder = {"name", "startdate", "enddate", "time"})
public class Task {

    private String name;
    private String startdate;
    private String enddate;
    private int time;

    public Task() {
    }

    public Task(String name, String startdate, String enddate, int time) {
        this.name = name;
        this.startdate = startdate;
        this.enddate = enddate;
        this.time = time;
    }

    public String getName() {
        return name;
    }

    @XmlElement
    public void setName(String name) {
        this.name = name;
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

    public int getTime() {
        return time;
    }

    @XmlElement
    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Task{" + "name=" + name + ", startdate=" + startdate + ", enddate=" + enddate + ", time=" + time + '}';
    }

    
    
}
