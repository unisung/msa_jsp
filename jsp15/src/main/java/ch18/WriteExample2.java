package ch18;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class WriteExample2 {
	public static void main(String[] args) {
		try {
			//byte단위 출력 객체 생성
			OutputStream os = new FileOutputStream("c:/temp/test2.db");

			byte[] arry = {10,20,30};
            
			os.write(arry);

			os.flush();
			os.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
