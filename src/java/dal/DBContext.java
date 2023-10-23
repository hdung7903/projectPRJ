package dal;

import entity.BaseEntity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T extends BaseEntity> {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=PRJAssignment";
            String user = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connection OK!");
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract ArrayList<T> list();

    public abstract void insert(T entity);

    public abstract void update(T entity);

    public abstract void delete(T entity);

    public abstract T get(T entity);
}
