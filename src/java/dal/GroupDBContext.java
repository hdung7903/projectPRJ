/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Attendance;
import entity.Group;
import entity.Instructor;
import entity.Session;
import entity.Subject;
import entity.TimeSlot;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class GroupDBContext extends DBContext<Group> {

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Group> getGroupList(int stuid, Date currentday) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT TOP 1 s.sesid, s.date, r.roomid, t.tid, g.gid, g.gname, su.subid, subname, s.isAtt, t.description, a.status, a.att_datetime\n"
                    + "FROM [Session] s \n"
                    + "INNER JOIN [Group_Student] gs ON gs.gid = s.gid\n"
                    + "INNER JOIN [Group] g ON g.gid = s.gid\n"
                    + "INNER JOIN [Student] st ON st.stuid = gs.stuid\n"
                    + "INNER JOIN [TimeSlot] t ON s.tid = t.tid\n"
                    + "INNER JOIN [Room] r ON r.roomid = s.rid\n"
                    + "INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "INNER JOIN [Attendance] a ON a.sesid = s.sesid\n"
                    + "WHERE st.stuid = ? AND s.[date] = ?\n"
                    + "ORDER BY a.att_datetime DESC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stuid);
            stm.setDate(2, currentday);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setName(rs.getString("gname"));
                Subject su = new Subject();
                su.setName(rs.getString("subname"));
                Attendance att = new Attendance();
                att.setStatus(rs.getBoolean("status"));
                TimeSlot ts = new TimeSlot();
                ts.setDescription(rs.getString("description"));
                Session ses = new Session();
                ses.setDate(rs.getDate("date"));
                g.setSession(ses);
                g.setAttendance(att);
                g.setSubject(su);
                g.setTimeslot(ts);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<Group> getInstructorGroup(int iid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT gid, gname, sup_iis FROM [Group] WHERE sup_iis=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setName(rs.getString("gname"));
                g.setId(rs.getInt("gid"));
                Instructor i = new Instructor();
                i.setId(rs.getInt("sup_iis"));
                g.setSupervisor(i);
                groups.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public List<Account> getAccountForGroups(int id) {
        List<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT a.email, a.fullname\n"
                    + "FROM Account a \n"
                    + "INNER JOIN [Student] s ON a.fullname = s.stuname\n"
                    + "INNER JOIN [Group_Student] gs ON gs.stuid = s.stuid\n"
                    + "where gs.gid=1\n"
                    + "ORDER BY s.stuid;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setFullname(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                accounts.add(acc);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
}
