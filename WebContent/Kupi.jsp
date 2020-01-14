<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kupovina</title>
<link href="MyCSS.css" rel="stylesheet" type="text/css">
</head>
<body>
<h2>Kupovina proizvoda: <%= request.getParameter("proizvod") %> </h2>

<form action="KupovinaNewServlet" method="get">
  <div class="imgcontainer">
    <img style="width: 300px" src="https://pngimage.net/wp-content/uploads/2018/06/product-icon-png-1.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
  	<input type="hidden" name="proizvodid" value="<%= request.getParameter("id") %>" required>
  	<input type="hidden" name="proizvod" value="<%= request.getParameter("proizvod") %>" required>
  	
  	<label for="Naziv"><b>Ime:</b></label>
    <input type="text" placeholder="Enter Ime" name="ime" required>

    <label for="Prezime"><b>Prezime:</b></label>
    <input type="text" placeholder="Enter Prezime" name="prezime" required>
        
    <input style="width: 100%; height: 40px; background-color: RGB(47,197,48); color: white;" type="submit" value="Zavrsi kupovinu">
  </div>
</form>
</body>
</html>