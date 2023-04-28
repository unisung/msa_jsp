package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Main23 {
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
				//3. sql문 작성
				String id="kang2";
				String name="강길동";
				String pwd="1234";
				int age=25;
				String email ="kang@daum.net";
				
				String sql ="insert into users values(?,?,?,?,?)";
				
				//3-2. sql문을 DBMS로 전달할 전달객체 생성
				PreparedStatement pstmt = conn.prepareStatement(sql);
				//3-3. ?(바인딩변수)에 값을 설정
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, pwd);
				pstmt.setInt(4, age);
				pstmt.setString(5, email);
				
				//4. sql문처리 실행 후 결과(몇개의 행이 입력되었는지) 확인
				int rows = pstmt.executeUpdate();
				System.out.println("입력된 행의수는 : "+rows+"입니다.");
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
