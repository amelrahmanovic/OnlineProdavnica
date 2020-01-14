<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Novi proizvod</title>
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