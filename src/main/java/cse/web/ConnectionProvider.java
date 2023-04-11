package cse.web;

import java.sql.*;

public class ConnectionProvider {
    private static Connection con = null;
    static {
        try {
            Class.forName(Provider.DRIVER);
            con = DriverManager.getConnection(Provider.CONNECTION_URL, Provider.USERNAME, Provider.PASSWORD);
        } catch (SQLException e) {
            // process sql exception
            ExceptionPrinter.printSQLException(e);
        } catch (ClassNotFoundException e) {
            System.out.println("ConnectionProvider.enclosing_method()");
        }
    }

    public static Connection getCon() {
        return con;
    }

}
