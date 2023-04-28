package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main4 {
	public static void main(String[] args) {
		try {
			//1. JDBC드라이버를 STATIC메모리에 로딩하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. 연결객체(Connection) 얻기
			// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "java", "oracle");
			if (conn != null) {
				System.out.println("연결성공!!!!");
				//3.sql문 작성
				String sql ="select * from users";
				//3-2. sql문 전달객체 생성
				Statement stmt = conn.createStatement();
				//4. sql문 전달 실행 후 결과받기
				ResultSet rs = stmt.executeQuery(sql);
				//5. 결과set 출력
				while(rs.next()) {
					/* 쿼리 결괏set의 칼럼명으로 추출 */
				  String userid = rs.getString("userid");
				  String username = rs.getString("username");
				  String userpass = rs.getString("userpassword");
				  int age = rs.getInt("userage");
				  String useremail = rs.getString("useremail");
				  System.out.println("정보:"+userid+","+username+","+userpass+","+age+","+useremail);
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
