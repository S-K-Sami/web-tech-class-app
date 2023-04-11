package cse.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// import cse.web.Course;
// import cse.web.CourseDao;

@WebServlet("/register_course")
public class CourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDao courseDao;

    public void init() {
        courseDao = new CourseDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String id = request.getParameter("id");
        String course_name = request.getParameter("course_name");
        int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));

        Course course = new Course();
        course.setID(id);
        course.setCourseName(course_name);
        course.setTeacherId(teacher_id);

        try {
            courseDao.registerCourse(course);
        } catch (Exception e) {
            // TOD Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("coursedetails.jsp");
    }
}
