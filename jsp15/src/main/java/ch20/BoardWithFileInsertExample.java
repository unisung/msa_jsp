package ch20;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BoardWithFileInsertExample {
	public static void main(String[] args) throws FileNotFoundException {
		try {
			// JDBC드라이버를 STATIC메모리에 로딩하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 연결객체(Connection) 얻기
			// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "java", "oracle");

			//
			String sql="insert into boards(bno,btitle,bcontent, bwriter, bfilename,bfiledata) "
					 + " values(?,?,?,?,?,?)";
			//3-2.
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, "눈오는 날");
			pstmt.setString(3, "함박눈이 내려요...");
			pstmt.setString(4, "winter");
			pstmt.setString(5,"snow.jpg");
			pstmt.setBlob(6, new FileInputStream("src/main/java/ch20/snow.jpg"));
			
			//4. 
			int rows =pstmt.executeUpdate();
			System.out.println("저장된 행 수: "+rows);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
