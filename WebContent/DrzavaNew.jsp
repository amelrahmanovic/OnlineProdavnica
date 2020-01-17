<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nova drzava</title>
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

<h2>Nova drzava:</h2>

<form action="DrzavaNewServlet" method="get">
  <div class="imgcontainer">
    <img style="width: 300px" src="http://cdn.onlinewebfonts.com/svg/img_169110.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
  
  	<label for="Ime"><b>Naziv drzave:</b></label>
    <input type="text" placeholder="Enter drzava" name="naziv" required>
        
    <input style="width: 100%; height: 40px; background-color: RGB(47,197,48); color: white;" type="submit" value="Snimi">
  </div>
</form>
</body>
</html>