package ch18;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;


public class CopyExample {
	public static void main(String[] args) {
		try {
			String originalFileName = "c:/temp/snow.jpg";
			String targetFileName = "c:/temp/snowCopy.jpg";
			
			//byte단위 출력 객체 생성
			InputStream is = new FileInputStream(originalFileName);
			OutputStream os = new FileOutputStream(targetFileName);

			byte[] arry = new byte[1024];//1kb씩 잘라서 입력
			
			while(true) {
				int num = is.read(arry);
				System.out.println("num:"+num);
				if(num==-1) break;
				os.write(arry, 0, num);//버퍼내의 길이만큼 출력
			}
			os.flush();//버퍼내용 밀어내기
			os.close();
			is.close();
			//
			System.out.println("복사가 잘 되었습니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
