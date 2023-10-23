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
public class Room extends BaseEntity{
    private String rid;
    private ArrayList<Session> sessions = new ArrayList<>();

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }
    
    
}
