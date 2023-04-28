package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Main5_update {
	public static void main(String[] args) {
		 Scanner scanner = new Scanner(System.in);
		try {
			//1. JDBC드라이버를 STATIC메모리에 로딩하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. 연결객체(Connection) 얻기
			// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "java", "oracle");
			if (conn != null) {
				System.out.println("연결성공!!!!");
			 //3. 
			 System.out.println("아이디를 입력하세요>");	
			 String id=scanner.nextLine().trim();
			 System.out.println("비번을 입력하세요>");
			 String pwd=scanner.nextLine().trim();
			 String sql="update users set USERPASSWORD=? where USERID=?";
			 //3-1.
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 //3-2.
			  pstmt.setString(1, pwd);
			  pstmt.setString(2,id);
			 //4.
			  int rows = pstmt.executeUpdate();
			 if(rows>0) {
				 System.out.println("변경성공");
			 }else {
				 System.out.println("변경실패");
			 }
				
			} else {
				System.out.println("연결실패!!!");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
