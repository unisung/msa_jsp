package ch18;

import java.io.FileInputStream;
import java.io.InputStream;


public class ReadExample {
	public static void main(String[] args) {
		try {
			//byte단위 입력 객체 생성
			InputStream is = new FileInputStream("c:/temp/test1.db");
			
			while(true) {
				int data = is.read();//byte단위의 값을 int타입으로 전달
				if(data==-1) break;//read()는 더 이상 값이 없으면 -1을 리턴함 
				System.out.println(data);
			}
			is.close();//스트림 해제
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
