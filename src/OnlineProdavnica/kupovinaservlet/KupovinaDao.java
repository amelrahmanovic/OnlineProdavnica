package OnlineProdavnica.kupovinaservlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import OnlineProdavnica.MySQLConfiguration.mysqlconfiguration;

public class KupovinaDao {
	public void New(String ime, String prezime, String proizvodid, String proizvod)
	{
		try {
			LocalDateTime now = LocalDateTime.now();
			final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("INSERT INTO `onlineprodavnica`.`kupovina`\r\n" + 
					"(`ProizvodId`, `NazivProizvoda`, `Ime`, `Prezime`, `DatumKupovine`)\r\n" + 
					"VALUES\r\n" + 
					"("+proizvodid+", '"+proizvod+"', '"+ime+"', '"+prezime+"', '"+dtf.format(now).toString()+"');\r\n" + 
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
			st.executeUpdate("delete from kupovina where id="+id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
