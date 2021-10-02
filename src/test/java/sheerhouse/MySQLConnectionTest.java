package sheerhouse;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://sheerhouse.c9ips7c9wmzr.us-east-2.rds.amazonaws.com:3306/sheerhouse?verifyServerCertificate=false&useSSL=false";
	private String user = "admin";
	private String password = "admin1234";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(driver);
		try {
			Connection connection = DriverManager.getConnection(url,user,password);
			System.out.println(connection);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
