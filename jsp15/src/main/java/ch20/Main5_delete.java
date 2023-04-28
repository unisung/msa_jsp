package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Main5_delete {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		try {
			//1. JDBC드라이버를 STATIC메모리에 로딩하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. 연결객체(Connection) 얻기
			// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "java", "oracle");
			//3-1.
			String sql="delete from users where userid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println("탈퇴할 id를 입력하세요>");
			String id = scanner.nextLine().trim();
			//3-2.
			pstmt.setString(1, id);
			//4.
			int rows = pstmt.executeUpdate();
			System.out.println(rows>0?"탈퇴처리완료":"실패");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
