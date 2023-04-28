package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Main5_insert {
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
			 //3. sql문
			 System.out.println("id를 입력하세요>");
			 String id=scanner.nextLine().trim();
			 System.out.println("이름을 입력하세요>");
			 String name=scanner.nextLine().trim();
			 System.out.println("비번을 입력하세요>");
			 String pwd=scanner.nextLine().trim();
			 System.out.println("나이를 입력하세요>");
			 int age = Integer.parseInt(scanner.nextLine().trim());
			 System.out.println("email을 입력하세요>");
			 String email=scanner.nextLine().trim();
				
			 String sql ="insert into users values(?,?,?,?,?)";	
			 //3-1. sql문 전달객체 생성
			 PreparedStatement pstmt = conn.prepareStatement(sql);	
			 //3-2. 값을 바인딩변수(?)에 설정
			 int cnt=0;
			 pstmt.setString(++cnt, id);
			 pstmt.setString(++cnt, name);
			 pstmt.setString(++cnt, pwd);
			 pstmt.setInt(++cnt, age);
			 pstmt.setString(++cnt, email);
			 
			 //4. DMBS로 전달 및 결과 출력
			 int rows = pstmt.executeUpdate();
			 System.out.println("입력행 수: "+rows);
				
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
