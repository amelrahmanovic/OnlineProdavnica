package OnlineProdavnica.adminservlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.Cookie;

import OnlineProdavnica.Models.Administratori;
import OnlineProdavnica.MySQLConfiguration.mysqlconfiguration;

public class AdminDao {
	
	public int FindbyUsername(String username)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from administratori where Username LIKE "+"'"+username+"'");
			if (rs.next()) {
				Administratori administrator = new Administratori();
				administrator.Id = rs.getInt("Id");
				administrator.Ime=rs.getString("Ime");
				administrator.Prezime=rs.getString("Prezime");
				administrator.Username=rs.getString("Username");
				administrator.Password=rs.getString("Password");
				System.out.println(administrator.Id+"******************");
				return administrator.Id;
			}
			return 0;
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	public boolean FindbyUsernamePassword(String username, String password)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from administratori where Username LIKE "+"'"+username+"'"+" AND Password LIKE "+"'"+password+"'");
			if (rs.next()) {
				Administratori administrator = new Administratori();
				administrator.Id = rs.getInt("Id");
				administrator.Ime=rs.getString("Ime");
				administrator.Prezime=rs.getString("Prezime");
				administrator.Username=rs.getString("Username");
				administrator.Password=rs.getString("Password");
				if (administrator.Id>0) {
					return true;
				}
				else {
					return false;
				}
			}
			return false;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	public void DeleteById(int id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("delete from administratori where id="+id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public void New(String ime, String prezime, String username, String password)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("INSERT INTO `onlineprodavnica`.`administratori`\r\n" + 
					"(`Ime`,\r\n" + 
					"`Prezime`,\r\n" + 
					"`Username`,\r\n" + 
					"`Password`)\r\n" + 
					"VALUES\r\n" + 
					"('"+ime+"',\r\n" + 
					"'"+prezime+"',\r\n" + 
					"'"+username+"',\r\n" + 
					"'"+password+"');");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
