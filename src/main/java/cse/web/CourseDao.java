package cse.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// import cse.web.Course;

public class CourseDao {
    public int registerCourse(Course course) throws ClassNotFoundException {
        String INSERT_COURSES_SQL = "INSERT INTO course" +
                "  (id, course_name, teacher_id) VALUES " +
                " (?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/web_app?useSSL=false", "sami", "sami6620");

                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURSES_SQL)) {
            preparedStatement.setString(1, course.getID());
            preparedStatement.setString(2, course.getCourseName());
            preparedStatement.setInt(3, course.getTeacherId());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            ExceptionPrinter.printSQLException(e);
        }
        return result;
    }
}
