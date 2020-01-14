<%@page import="OnlineProdavnica.MySQLConfiguration.mysqlconfiguration"%>
<%@page import="OnlineProdavnica.Models.Proizvodi"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="OnlineProdavnica.proizvodservlet.ProizvodDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
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
<h2 align="center"><font><strong>Proizvodi:</strong></font></h2>
<table align="center" border="1" style="width: 100%">
<tr>

</tr>
<tr style="background-color: RGB(47,197,48)">
<td><b>Proizvod:</b></td>
<td><b>Opis:</b></td>
<td><b>Datum objave:</b></td>
<td><b>Slika:</b></td>
<td><b>Akcija</b></td>
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

<td> <%=resultSet.getString("Naziv") %> </td>
<td><%=resultSet.getString("Opis") %></td>
<td><%=resultSet.getString("DatumObjave") %></td>
<td> <img src="<%=resultSet.getString("UrlSlike") %>" height="200px"> </td>
<td> <a href="Kupi.jsp?id=<%=resultSet.getString("Id") %>&proizvod=<%=resultSet.getString("Naziv") %>"> <button style="width: 100%; height: 100px;">Kupi</button> </a> </td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>