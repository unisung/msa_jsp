package ch18;

import java.io.FileInputStream;
import java.io.InputStream;


public class ReadExample2 {
	public static void main(String[] args) {
		try {
			//byte단위 출력 객체 생성
			InputStream is = new FileInputStream("c:/temp/test2.db");

			byte[] arry = new byte[100];//[10][20][30]
			
			while(true) {
				int num = is.read(arry);
				System.out.println("num:"+num);
				if(num==-1) break;
				for(int i=0;i<num;i++) {
					System.out.println(arry[i]);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
