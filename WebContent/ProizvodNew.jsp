<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Novi proizvod</title>
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

<h2>Novi proizvod:</h2>

<form action="ProizvodNewServlet" method="get">
  <div class="imgcontainer">
    <img style="width: 300px" src="https://pngimage.net/wp-content/uploads/2018/06/product-icon-png-1.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
  
  	<label for="Naziv"><b>Naziv:</b></label>
    <input type="text" placeholder="Enter Naziv" name="naziv" required>

    <label for="Prezime"><b>Opis:</b></label>
    <input type="text" placeholder="Enter Opis" name="opis" required>
  
    <label for="uname"><b>URL Slika:</b></label>
    <input type="text" placeholder="Enter URL Slike" name="urlslika" required>
        
    <input style="width: 100%; height: 40px; background-color: RGB(47,197,48); color: white;" type="submit" value="Snimi">
  </div>
</form>
</body>
</html>