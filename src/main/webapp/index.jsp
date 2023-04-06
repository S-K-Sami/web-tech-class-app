<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>JSP Servlet Example</title>
		<script>
			function user_register() {
				window.open("userregister.jsp", "_self");
			}
		</script>
	</head>

	<body>
		<div align="center" style="margin-top: 50px;">
			<form action="JSPServlet">
				Please enter your Username: <input type="text" name="username" size="20px"> <br>
				Please enter your Password: <input type="text" name="password" size="20px"> <br><br>
				<input type="submit" value="submit">
			</form>
		</div>
		<div>
			<button onclick="user_register()">User Register</button>
		</div>
	</body>

	</html>