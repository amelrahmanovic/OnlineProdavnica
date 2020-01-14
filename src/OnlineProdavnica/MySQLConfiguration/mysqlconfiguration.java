package OnlineProdavnica.MySQLConfiguration;

public class mysqlconfiguration {
	public String JDBC;
	public String Username;
	public String Password;
	public mysqlconfiguration() {
		super();
		JDBC = "jdbc:mysql://192.168.1.200:3306/onlineprodavnica?useTimezone=true&serverTimezone=UTC";
		Username = "onlineprodavnica";
		Password = "Dn<9{#(nRhtMp>-m";
	}
	
}
