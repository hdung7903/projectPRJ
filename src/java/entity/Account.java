/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class Account extends BaseEntity {
    private String username;
    private String password;
    private String displayname;
    private Student student;
    private Instructor instructor;
    private boolean isStudent;
    private boolean isInstructor;

    public Account() {
    }

    public Account(String username, String password, String displayname, Student student, Instructor instructor, boolean isStudent, boolean isInstructor) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.student = student;
        this.instructor = instructor;
        this.isStudent = isStudent;
        this.isInstructor = isInstructor;
    }   

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public boolean isIsStudent() {
        return isStudent;
    }

    public void setIsStudent(boolean isStudent) {
        this.isStudent = isStudent;
    }

    public boolean isIsInstructor() {
        return isInstructor;
    }

    public void setIsInstructor(boolean isInstructor) {
        this.isInstructor = isInstructor;
    }

    
}
