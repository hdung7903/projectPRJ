/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author leduy
 */
public class AttendanceRecord extends BaseEntity {
    private Group group;
    private Session session;
    private Student student;
    private boolean status;

    public AttendanceRecord(Group group, Session session, Student student, boolean status) {
        this.group = group;
        this.session = session;
        this.student = student;
        this.status = status;
    }

    public Group getGroup() {
        return group;
    }

    public Session getSession() {
        return session;
    }

    public Student getStudent() {
        return student;
    }

    public boolean isStatus() {
        return status;
    }

}
