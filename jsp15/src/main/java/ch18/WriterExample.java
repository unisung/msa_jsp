package ch18;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.Writer;

public class WriterExample {
	public static void main(String[] args) {
      try {
    	    //2byte씩 읽어들이는 스트림객체 생성
    	    Writer writer = new FileWriter("c:/Temp/test.txt");
    	    //1 문자씩 출력
    	    char a ='A';
    	    writer.write(a);
    	    char b ='B';
    	    writer.write(b);
    	    
    	    //문자배열 출력
    	    char[] arr = {'C','D','F'};
    	    writer.write(arr);
    	    
    	    //문자열 출력
    	    writer.write("FGH");
    	    
    	    ///버퍼 비우기
    	    writer.flush();
    	    //출력 스트림 닫고 메모리 해제
    	    writer.close();
    	    
      }catch(Exception e) {
    	  
      }

	}

}
