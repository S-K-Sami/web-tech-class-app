<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome</title>
	<script>
		function user_register() {
			window.open("userregister.jsp", "_self");
		}
		function course_register() {
			window.open("courseregister.jsp", "_self");
		}
	</script>
</head>

<body>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
        url = "jdbc:mysql://localhost:3306/web_app?useSSL=false"
        user = "sami"  password = "sami6620"/>

    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * FROM web_app.course JOIN web_app.user ON web_app.course.teacher_id = web_app.user.id
    </sql:query>

	<div align="center" style="margin-top: 50px;">
		<form action="JSPServlet">
			Please enter your Username: <input type="text" name="username" size="20px"> <br>
			Please enter your Password: <input type="text" name="password" size="20px"> <br><br>
			<input type="submit" value="submit">
		</form>
	</div>
	<div>
		<a href="login.jsp">login</a>|  
		<a href="logout.jsp">logout</a>|  
		<a href="profile.jsp">profile</a>
	</div>
	<div>
		<button onclick="user_register()">User Register</button>
	</div>
	<div>
		<button onclick="course_register()">Course Register</button>
	</div>
	<div>
		<table style="width: 80%;">
			<tr>
				<th>Course ID</th>
				<th>Course Name</th>
				<th>Course Teacher</th>
			</tr>
			<c:forEach var = "row" items = "${result.rows}">
				<tr>
					<td>${row.id}</td>
					<td>${row.course_name}</td>
					<td>${row.first_name} ${row.last_name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

</html>