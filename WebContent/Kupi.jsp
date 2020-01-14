<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kupovina</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
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