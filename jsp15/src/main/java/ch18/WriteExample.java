package ch18;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class WriteExample {
	public static void main(String[] args) {
		try {
			//byte단위 출력 객체 생성
			OutputStream os = new FileOutputStream("c:/temp/test1.db");
			
			byte a = 10;
			byte b = 20;
			byte c = 30;
			
			os.write(a);
			os.write(b);
			os.write(c);

			os.flush();
			os.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
