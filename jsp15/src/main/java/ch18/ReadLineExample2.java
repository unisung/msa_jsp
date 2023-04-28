package ch18;

import java.io.FileReader;
import java.io.Reader;

public class ReadLineExample2 {
	public static void main(String[] args) {
      try {
    	    //2byte씩 읽어들이는 스트림객체 생성
    	    Reader reader=null;
    	    reader = new FileReader("c:/Temp/test.txt");
            //한 문자씩 배열에 저장
    	    char[] data = new char[100];
    	    
    	    while(true) {
    	    	int num = reader.read(data);//문자 배열에 저장된 길이를 리턴
    	    	if(num==-1)break;//파일의 끝이면 종료
    	    	for(int i=0;i<num;i++) {
    	    		System.out.print(data[i]);
    	    	}
    	    }
    	    reader.close();
      }catch(Exception e) {
      }
	}
}
