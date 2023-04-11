<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Course Register</title>
</head>

<body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/web_app?useSSL=false"
        user = "sami"  password = "sami6620"/>

    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * FROM web_app.user WHERE type="teacher"
    </sql:query>

    <div align="center">
        <h1>Course Register Form</h1>
        <form action="<%= request.getContextPath() %>/register_course" method="post">
            <table style="width: 80%">
                <tr>
                    <td>Course ID</td>
                    <td><input type="text" name="id" /></td>
                </tr>
                <tr>
                    <td>Course Name</td>
                    <td><input type="text" name="course_name" /></td>
                </tr>
                <tr>
                    <td><label for="teachers">Course Teacher</label></td>
                    <td>
                        <select name="teacher_id" id="teachers">
                            <c:forEach var = "row" items = "${result.rows}">
                                <option value="${row.id}">${row.first_name} ${row.last_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
        </form>
    </div>
</body>

</html>