<%@page import="OnlineProdavnica.MySQLConfiguration.mysqlconfiguration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meni</title>
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
                   out.print("Dobro dosli: " + cookie.getValue( )+" <br/>");
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
</body>
</html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<br>
<a style="display: block; height: 25px; background: #4E9CAF; padding: 10px; text-align: center; border-radius: 5px; color: white; font-weight: bold;" href="AdminNew.jsp">Novi administrator</a>
<h2 align="center"><font><strong>Administratori:</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="4" border="1">
<tr>

</tr>
<tr style="background-color: RGB(47,197,48)">
<td><b>Id:</b></td>
<td><b>Admin:</b></td>
<td><b>Username:</b></td>
<td><b>Akcija:</b></td>
</tr>
<%
try{ 
	mysqlconfiguration mysqlc = new mysqlconfiguration();
connection = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
statement=connection.createStatement();
String sql ="SELECT * FROM administratori";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("Id") %></td>
<td> <%=resultSet.getString("Ime") %> <%=resultSet.getString("Prezime") %> </td>
<td><%=resultSet.getString("Username") %></td>
<td> 
<form action="AdminDeleteServlet" method="get">
  <div class="container">
    <input type="hidden" placeholder="Enter Username" name="id" value="<%=resultSet.getString("Id") %>">
    <input style="width: 100%; height: 40px; background-color: red; color: white;" type="submit" value="Izbrisi">
  </div>
</form>
</td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<br>
<a style="display: block; height: 25px; background: #4E9CAF; padding: 10px; text-align: center; border-radius: 5px; color: white; font-weight: bold;" href="ProizvodNew.jsp">Novi proizvod</a>


<br>
<h2 align="center"><font><strong>Proizvodi:</strong></font></h2>
<table align="center" border="1" style="width: 100%">
<tr>

</tr>
<tr style="background-color: RGB(47,197,48)">
<td><b>Id:</b></td>
<td><b>Proizvod:</b></td>
<td><b>Opis:</b></td>
<td><b>Datum objave:</b></td>
<td><b>Slika:</b></td>
<td><b>Akcija:</b></td>
</tr>
<%
try{ 
	mysqlconfiguration mysqlc = new mysqlconfiguration();
connection = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
statement=connection.createStatement();
String sql ="SELECT * FROM proizvodi";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("Id") %></td>
<td> <%=resultSet.getString("Naziv") %> </td>
<td><%=resultSet.getString("Opis") %></td>
<td><%=resultSet.getString("DatumObjave") %></td>
<td><%=resultSet.getString("UrlSlike") %></td>
<td> 
<form action="ProizvodDeleteServlet" method="get">
  <div class="container">
    <input type="hidden" placeholder="Enter Username" name="id" value="<%=resultSet.getString("Id") %>">
    <input style="width: 100%; height: 40px; background-color: red; color: white;" type="submit" value="Izbrisi">
  </div>
</form>
</td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


<br>
<h2 align="center"><font><strong>Historija kupovine:</strong></font></h2>
<table align="center" border="1" style="width: 100%">
<tr>

</tr>
<tr style="background-color: RGB(47,197,48)">
<td><b>Id:</b></td>
<td><b>Proizvod:</b></td>
<td><b>Kupac:</b></td>
<td><b>Datum kupovine:</b></td>
<td><b>Akcija:</b></td>
</tr>
<%
try{ 
	mysqlconfiguration mysqlc = new mysqlconfiguration();
	connection = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
statement=connection.createStatement();
String sql ="SELECT * FROM kupovina";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("Id") %></td>
<td> <%=resultSet.getString("NazivProizvoda") %> </td>
<td><%=resultSet.getString("Ime") %> <%=resultSet.getString("Prezime") %></td>
<td><%=resultSet.getString("DatumKupovine") %></td>
<td> 
<form action="KupovinaDeleteServlet" method="get">
  <div class="container">
    <input type="hidden" placeholder="Enter Username" name="id" value="<%=resultSet.getString("Id") %>">
    <input style="width: 100%; height: 40px; background-color: red; color: white;" type="submit" value="Izbrisi">
  </div>
</form>
</td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>