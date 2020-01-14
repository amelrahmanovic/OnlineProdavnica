package OnlineProdavnica.proizvodservlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import OnlineProdavnica.Models.Administratori;
import OnlineProdavnica.Models.Proizvodi;
import OnlineProdavnica.MySQLConfiguration.mysqlconfiguration;

public class ProizvodDao {
	public void New(String naziv, String opis, String datumobjave, String urlslike)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			st.executeUpdate("INSERT INTO `proizvodi`\r\n" + 
					"(`Naziv`,\r\n" + 
					"`Opis`,\r\n" + 
					"`DatumObjave`,\r\n" + 
					"`UrlSlike`)\r\n" + 
					"VALUES\r\n" + 
					"('"+naziv+"',\r\n" + 
					"'"+opis+"',\r\n" + 
					"'"+datumobjave+"',\r\n" + 
					"'"+urlslike+"');");
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
			st.executeUpdate("delete from proizvodi where Id="+id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public Proizvodi[] GetAll()
	{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			mysqlconfiguration mysqlc = new mysqlconfiguration();
			Connection con = DriverManager.getConnection(mysqlc.JDBC, mysqlc.Username, mysqlc.Password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from proizvodi");
			Proizvodi[] ProizvodiList = new Proizvodi[10000];
			int brojac=0;
			while(rs.next()){
				Proizvodi proizvod = new Proizvodi();
				proizvod.Id = rs.getInt("Id");
				proizvod.Naziv=rs.getString("Naziv");
				proizvod.Opis=rs.getString("Opis");
				proizvod.UrlSlike=rs.getString("UrlSlike");
				ProizvodiList[brojac]=proizvod;
				brojac++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
