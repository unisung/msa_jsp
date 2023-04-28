package ch18;

import java.io.FileWriter;
import java.io.Writer;
import java.util.Scanner;

public class WriterExample2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
      try {
    	    //2byte씩 읽어들이는 스트림객체 생성
    	    Writer writer = new FileWriter("c:/Temp/test3.txt",true);
    	    System.out.println("파일로 저장할 메세지를 입력하세요>");
    	    String msg = scanner.nextLine();
    	    
    	    //문자열 출력
    	    writer.write(msg+"\n");
    	    
    	    ///버퍼 비우기
    	    writer.flush();
    	    //출력 스트림 닫고 메모리 해제
    	    writer.close();
    	    
      }catch(Exception e) {
    	  
      }

	}

}
