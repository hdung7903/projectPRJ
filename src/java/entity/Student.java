/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author leduy
 */
public class Student extends BaseEntity{
    private int id;
    private String name;
    private String email;
    private Date dob;
    private boolean gender;
    private ArrayList<Group> groups = new ArrayList<>();
    private List<Boolean> status= new ArrayList<>();
    private List<Boolean> attendances;

    public Student() {
    }

    public Student(String name, String email, List<Boolean> attendances) {
    this.name = name;
    this.email = email;
    this.attendances = attendances;
  }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }


    public String getEmail() {
        return email;
    }

    public void setStatus(ArrayList<Boolean> status) {
        this.status = status;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public List<Boolean> getStatus() {
        return status;
    }

    public void setStatus(List<Boolean> status) {
        this.status = status;
    }

    public List<Boolean> getAttendances() {
        return attendances;
    }

    public void setAttendances(List<Boolean> attendances) {
        this.attendances = attendances;
    }

    
}
