package ch20;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardSelectExample {
	public static void main(String[] args) throws IOException {
		try {
			// JDBC드라이버를 STATIC메모리에 로딩하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 연결객체(Connection) 얻기
			// jdbc프로토콜:oracle프로토콜:thin드라이버:서버localhost, port번호1521, 서비스명(sid) xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "java", "oracle");

			//
			String sql="select bno, btitle,bcontent, bwriter, bdate, bfilename, bfiledata  "
					 + " from boards where bwriter=?";
			//3-2.
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "winter");
			
			//4. 
			ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
            	String filename= rs.getString(6);
            	//저장경로
            	OutputStream os = new FileOutputStream("c:/temp/"+filename);
            	//Binary형태의 large 객체저장 객체 Blob
            	Blob blob = rs.getBlob(7);
            	//DB로 부터 추출한 Blob객체를 읽어들이는 스트림 경로 생성
            	InputStream is = blob.getBinaryStream();
            	//읽어들인 stream을 저장소로 이동처리
            	is.transferTo(os);
            	os.flush();//스트림 데이타 밀어내기
            	os.close();//닫기
            	is.close();//입력스트림 닫기
 
            }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
