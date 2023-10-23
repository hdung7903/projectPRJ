/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.BaseEntity;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class Group extends BaseEntity {

    private int id;
    private String name;
    private ArrayList<Student> students = new ArrayList<>();
    private Instructor supervisor;
    private Subject subject;

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

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public Instructor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Instructor supervisor) {
        this.supervisor = supervisor;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

}
