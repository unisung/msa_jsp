package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws SQLException,ClassNotFoundException{
		
		String url="jdbc:mysql://localhost:3306/WebmarketDB";
		String driver="com.mysql.cj.jdbc.Driver";
		String user="root";
		String password="1234";
		
		Class.forName(driver);
		
		return DriverManager.getConnection(url, user, password);
		
	}
}
