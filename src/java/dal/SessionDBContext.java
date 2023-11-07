/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.Attendance;
import entity.Group;
import entity.Room;
import entity.Session;
import entity.Subject;
import entity.TimeSlot;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getSessions(int iid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT s.sesid,s.date,r.roomid,t.tid,g.gid,g.gname,su.subid,subname,i.iid,i.iname,s.isAtt\n"
                    + "FROM [Session] s INNER JOIN [Instructor] i ON i.iid = s.iid\n"
                    + "				INNER JOIN [Group] g ON g.gid = s.gid\n"
                    + "				INNER JOIN [TimeSlot] t ON s.tid = t.tid\n"
                    + "				INNER JOIN [Room] r ON r.roomid = s.rid\n"
                    + "				INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "		WHERE i.iid = ? AND s.[date] >= ? AND s.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room room = new Room();
                room.setRid(rs.getString("roomid"));
                session.setRoom(room);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                session.setTime(t);
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("subname"));
                session.setSubject(subject);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public Timestamp getAttendanceDateTime(int sessionId) {
        Timestamp attDateTime = null;
        try {
            String sql = "SELECT s.sesid, s.date, r.roomid, t.tid, t.description, g.gid, g.gname, su.subid, subname, i.iid, i.iname, s.isAtt, a.att_datetime "
                    + "FROM [Session] s "
                    + "INNER JOIN [Instructor] i ON i.iid = s.iid "
                    + "INNER JOIN [Group] g ON g.gid = s.gid "
                    + "INNER JOIN [TimeSlot] t ON s.tid = t.tid "
                    + "INNER JOIN [Room] r ON r.roomid = s.rid "
                    + "INNER JOIN [Subject] su ON g.subid = su.subid "
                    + "INNER JOIN Attendance a ON s.sesid = a.sesid "
                    + "WHERE s.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getTimestamp("att_datetime");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attDateTime;
    }

    public ArrayList<Session> getSessionByDate(int iid, Date currentday) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT s.sesid,s.date,r.roomid,t.tid,g.gid,g.gname,su.subid,subname,i.iid,i.iname,s.isAtt,t.description\n"
                    + "FROM [Session] s INNER JOIN [Instructor] i ON i.iid = s.iid\n"
                    + "	INNER JOIN [Group] g ON g.gid = s.gid\n"
                    + "INNER JOIN [TimeSlot] t ON s.tid = t.tid\n"
                    + "INNER JOIN [Room] r ON r.roomid = s.rid\n"
                    + "INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "	WHERE i.iid = ? AND s.[date] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            stm.setDate(2, currentday);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room room = new Room();
                room.setRid(rs.getString("roomid"));
                session.setRoom(room);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                session.setTime(t);
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("subname"));
                session.setSubject(subject);
                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }
    
    public void addAttendance(Session ses) {
        try {
            connection.setAutoCommit(false);

            String deleteAttendanceQuery = "DELETE FROM Attendance WHERE sesid=?";
            PreparedStatement deleteAttendanceStmt = connection.prepareStatement(deleteAttendanceQuery);
            deleteAttendanceStmt.setInt(1, ses.getId());
            deleteAttendanceStmt.executeUpdate();

            String updateSessionQuery = "UPDATE [Session] SET isAtt = 1 WHERE sesid=?";
            PreparedStatement updateSessionStmt = connection.prepareStatement(updateSessionQuery);
            updateSessionStmt.setInt(1, ses.getId());
            updateSessionStmt.executeUpdate();

            String insertAttendanceQuery = "INSERT INTO [Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) "
                    + "VALUES (?, ?, ?, ?, GETDATE())";
            PreparedStatement insertAttendanceStmt = connection.prepareStatement(insertAttendanceQuery);
            for (Attendance att : ses.getAtts()) {
                insertAttendanceStmt.setInt(1, ses.getId());
                insertAttendanceStmt.setInt(2, att.getStudent().getId());
                insertAttendanceStmt.setBoolean(3, att.isStatus());
                insertAttendanceStmt.setString(4, att.getDescription());
                insertAttendanceStmt.executeUpdate();
            }

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int getTotalSession(int iid, int gid) {
        int total = 0;
        try {
            
            String sql = "SELECT COUNT(DISTINCT s.[index]) AS Total\n"
                    + "FROM [Session] s\n"
                    + "JOIN [Attendance] a ON a.[sesid] = s.[sesid]\n"
                    + "where s.iid=? and s.gid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            stm.setInt(2, gid);
            ResultSet rs=stm.executeQuery();
            if(rs.next()){
                total=rs.getInt("Total");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(Session entity) {
        try {
            String sql = "SELECT s.sesid,s.date,r.roomid,t.tid,t.description,g.gid,g.gname,su.subid,subname,i.iid,i.iname,s.isAtt,a.att_datetime\n"
                    + "                 FROM [Session] s INNER JOIN [Instructor] i ON i.iid = s.iid\n"
                    + "                 INNER JOIN [Group] g ON g.gid = s.gid\n"
                    + "            	INNER JOIN [TimeSlot] t ON s.tid = t.tid\n"
                    + "      		INNER JOIN [Room] r ON r.roomid = s.rid\n"
                    + "      		INNER JOIN [Subject] su ON g.subid = su.subid\n"
                    + "			INNER JOIN Attendance a ON s.sesid = a.sesid\n"
                    + "	WHERE s.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room room = new Room();
                room.setRid(rs.getString("roomid"));
                session.setRoom(room);
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                session.setTime(t);
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("subname"));
                session.setSubject(subject);
                return session;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
