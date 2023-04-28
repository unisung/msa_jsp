package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MainConn {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//1. jdbc드라이버 로딩(static영역)
		Class.forName("oracle.jdbc.OracleDriver");
		//2. Connection(연결객체) 생성
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				                                      "java",
				                                      "oracle");
		System.out.println(conn!=null? "연결 성공":"실패");
		//3. sql문작성 및 sql문 전달 객체(Statement,PreparedStatement) 생성
		String sql ="select * from users order by userid";
		Statement stmt = conn.createStatement();
		
		//4. DBMS로 전달 및 결과 출력
		ResultSet rs = stmt.executeQuery(sql);
		/*rs.next();
		System.out.println(rs.getString(1)+","+rs.getString(2)+","
		                  +rs.getString(3)+","+rs.getInt(4)+","+rs.getString(5)); 
		rs.next();
		System.out.println(rs.getString(1)+","+rs.getString(2)+","
		                  +rs.getString(3)+","+rs.getInt(4)+","+rs.getString(5)); 
		*/
		while(rs.next()) {
			System.out.println(rs.getString(1)+","+rs.getString(2)+","
	                  +rs.getString(3)+","+rs.getInt(4)+","+rs.getString(5)); 	
		}
	}
}
/*
CREATE TABLE USERS 
(	USERID VARCHAR2(30), 
	USERNAME VARCHAR2(50), 
	USERPASSWORD VARCHAR2(30), 
	USERAGE NUMBER, 
	USEREMAIL VARCHAR2(50), 
	 PRIMARY KEY (SERID)
);	 
*/