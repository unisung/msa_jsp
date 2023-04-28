package ch18;

import java.io.FileReader;
import java.io.Reader;

public class ReadLineExample {
	public static void main(String[] args) {
      try {
    	    //2byte씩 읽어들이는 스트림객체 생성
    	    Reader reader=null;
    	    reader = new FileReader("c:/Temp/test.txt");
    	    
    	    while(true) {
    	    	int data = reader.read();//한 문자씩 읽어서 int타입으로 리턴
    	    	if(data==-1)break;
    	    	System.out.print((char)data);
    	    }
    	    reader.close();
      }catch(Exception e) {
    	  
      }

	}

}
