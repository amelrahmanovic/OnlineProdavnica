package OnlineProdavnica.drzavaservlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import OnlineProdavnica.MySQLConfiguration.mysqlconfiguration;

public class DrzavaDao {
	public void New(String naziv)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("INSERT INTO `onlineprodavnica`.`drzave`\r\n" + 
					"(`Naziv`)\r\n" + 
					"VALUES\r\n" + 
					"('"+naziv+"');\r\n" + 
					"");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public void DeleteById(int id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("delete from drzave where id="+id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
