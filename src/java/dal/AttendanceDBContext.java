/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.AttendanceRecord;
import entity.Group;
import entity.Session;
import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendances(int sessid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,ISNULL(a.status,0) as [status], \n"
                    + "  ISNULL(a.description,'') as [description],\n"
                    + "  ISNULL(a.att_datetime, GETDATE()) as [att_datetime],\n"
                    + "  a.sesid\n"
                    + "  FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "	INNER JOIN [Group_Student] gs ON g.gid = gs.gid\n"
                    + "	INNER JOIN [Student] s ON s.stuid = gs.stuid\n"
                    + "	LEFT JOIN Attendance a ON s.stuid = a.stuid \n"
                    + "	AND ses.sesid = a.sesid\n"
                    + "	WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sessid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student student = new Student();
                Session session = new Session();
                student.setId(rs.getInt("stuid"));
                student.setName(rs.getString("stuname"));
                session.setId(sessid);
                att.setStudent(student);
                att.setSession(session);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    public List<Attendance> getAttendanceRecords(int groupId) throws SQLException {
        List<Attendance> attendanceList = new ArrayList<>();
         String sql = "SELECT g.[gname], s.[stuid], s.[stuname], ses.[sesid], a.status " +
                         "FROM [Group] g " +
                         "INNER JOIN [Group_Student] gs ON g.[gid] = gs.[gid] " +
                         "INNER JOIN [Student] s ON gs.[stuid] = s.[stuid] " +
                         "INNER JOIN [Session] ses ON g.[gid] = ses.[gid] " +
                         "LEFT JOIN Attendance a ON ses.sesid = a.sesid AND gs.stuid = a.stuid AND a.att_datetime IS NOT NULL " +
                         "WHERE g.[gid] = 1 and a.status IS NOT NULL";
         try{
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                Attendance att = new Attendance();
                Group g = new Group();
                Student st = new Student();
                Session ses= new Session();
                g.setName(rs.getString("gname"));
                st.setId(rs.getInt("stuid"));
                st.setName(rs.getString("stuname"));
                ses.setId(rs.getInt("sesid"));
                att.setStatus(rs.getBoolean("status"));
                att.setGroup(g);
                att.setStudent(st);
                att.setSession(ses);
                attendanceList.add(att);
            }
         } catch (Exception e) {
            e.printStackTrace();
        }
         return attendanceList;
    }

    public int sessionAttended(int groupId) {
        int sessionCount = 0;

        String sql = "SELECT COUNT(DISTINCT s.sesid) AS SessionCount "
                + "FROM Session s "
                + "INNER JOIN Attendance a ON s.sesid = a.sesid "
                + "INNER JOIN [Group] g ON g.[gid] = s.[gid] "
                + "WHERE a.att_datetime IS NOT NULL AND g.gid = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, groupId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                sessionCount = resultSet.getInt("SessionCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sessionCount;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
