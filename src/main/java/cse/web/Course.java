package cse.web;

public class Course {
    // private static final long serialVersionUID = 1L;
    private String id;
    private String course_name;
    private int teacher_id;
    public String getID() {
        return id;
    }
    public void setID(String id) {
        this.id = id;
    }
    public String getCourseName() {
        return course_name;
    }
    public void setCourseName(String course_name) {
        this.course_name = course_name;
    }
    public int getTeacherId() {
        return teacher_id;
    }
    public void setTeacherId(int teacher_id) {
        this.teacher_id = teacher_id;
    }
}
