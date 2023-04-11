package cse.web;

import java.sql.*;

public class LoginDao {
    public static boolean validate(LoginBean bean) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM web_app.user WHERE username=? and password=?"
            );
            System.out.println(bean.getUsername());
            System.out.println(bean.getPassword());
            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            ExceptionPrinter.printSQLException(e);
        }

        return status;

    }

}
