<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Novi administrator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="MyCSS.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
        	 boolean findUser = false;
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName( ).equals("username"))
               {
                   findUser=true;
               }
            }
            if(findUser==false)
            {
            	response.sendRedirect("AdminLogin.jsp");
            }
         } else {
        	 response.sendRedirect("AdminLogin.jsp");
         }
      %>
 <a style="display: block; height: 25px; background: #4E9CAF; padding: 10px; text-align: center; border-radius: 5px; color: white; font-weight: bold;" href="Meni.jsp">Meni</a>

<h2>Novi administrator:</h2>

<form action="AdminNewServlet" method="get">
  <div class="imgcontainer">
    <img style="width: 300px" src="https://www.ordermo.ph/images/default_avatar.svg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
  
  	<label for="Ime"><b>Ime:</b></label>
    <input type="text" placeholder="Enter Ime" name="ime" required>

    <label for="Prezime"><b>Prezime:</b></label>
    <input type="text" placeholder="Enter Prezime" name="prezime" required>
  
    <label for="uname"><b>Username:</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password:</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <input style="width: 100%; height: 40px; background-color: RGB(47,197,48); color: white;" type="submit" value="Snimi">
  </div>
</form>

</body>
</html>