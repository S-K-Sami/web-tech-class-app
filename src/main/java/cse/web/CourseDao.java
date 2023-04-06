package cse.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import cse.web.Course;

public class CourseDao {
    public int registerCourse(Course course) throws ClassNotFoundException {
        String INSERT_COURSES_SQL = "INSERT INTO course" +
                "  (teacher_id) VALUES " +
                " (?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/web_app?useSSL=false", "sami", "sami6620");

                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURSES_SQL)) {
            preparedStatement.setInt(1, course.getTeacherId());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
