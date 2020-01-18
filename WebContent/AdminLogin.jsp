<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="MyCSS.css" rel="stylesheet" type="text/css">
</head>
<body>

<h2>Login Form</h2>

<form action="AdminLoginServlet" method="get">
  <div class="imgcontainer">
    <img style="width: 300px" src="https://www.ordermo.ph/images/default_avatar.svg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>Username:</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password:</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <input style="width: 100%; height: 40px; background-color: RGB(47,197,48); color: white;" type="submit" value="Login">
  </div>
</form>

<a style="display: block; height: 25px; background: #4E9CAF; padding: 10px; text-align: center; border-radius: 5px; color: white; font-weight: bold;" href="index.jsp">Nazad</a>

</body>
</html>