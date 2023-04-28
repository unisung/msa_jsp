package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class MainConn32 {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Scanner scanner = new Scanner(System.in);
		//1. jdbc드라이버 로딩(static영역)
		Class.forName("oracle.jdbc.OracleDriver");
		//2. Connection(연결객체) 생성
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				                                      "java",
				                                      "oracle");
		System.out.println(conn!=null? "연결 성공":"실패");
		//3. sql문작성 및 sql문 전달 객체(Statement,PreparedStatement) 생성
		System.out.println("검색할 회원의 나이대를 입력하세요>");
		int age = Integer.parseInt(scanner.nextLine().trim());//나이대 21~29
		int age1 = age+1;//21 
		int age2 = age1+9;//30
		String sql ="select * from users where userage between ? and ? order by userid";
		System.out.println("sql:"+sql);
		PreparedStatement stmt = conn.prepareStatement(sql);
		//3-2. stmt 값 설정
		stmt.setInt(1, age1);
		stmt.setInt(2, age2);
		
		//4. DBMS로 전달 및 결과 출력
		ResultSet rs = stmt.executeQuery();

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