/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staxiteratordemo;

/**
 *
 * @author KienLT
 */
public class Task {

    private String name;
    private String startdate;
    private String enddate;
    private String timeUnit;
    private int time;

    public Task() {
    }

    public Task(String name, String startdate, String enddate, String timeUnit, int time) {
        this.name = name;
        this.startdate = startdate;
        this.enddate = enddate;
        this.timeUnit = timeUnit;
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getTimeUnit() {
        return timeUnit;
    }

    public void setTimeUnit(String timeUnit) {
        this.timeUnit = timeUnit;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Task{" + "name=" + name + ", startdate=" + startdate + ", enddate=" + enddate + ", timeUnit=" + timeUnit + ", time=" + time + '}';
    }

}
