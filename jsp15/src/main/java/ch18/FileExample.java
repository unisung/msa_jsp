package ch18;

import java.io.File;
import java.io.IOException;

public class FileExample {
	public static void main(String[] args) throws Exception {
	 //File 객체 생성
	 File dir = new File("c:/temp/images");
	 File file1 = new File("c:/Temp/file1.txt");
	 File file2 = new File("c:/temp/file2.txt");
	 File file3 = new File("c:/Temp/file3.txt");
	 
	 //존재하지 않으면 디렉토리나 파일 생성
	 if(dir.exists()==false) {dir.mkdirs();}
	 if(file1.exists()==false) {file1.createNewFile();}
	 if(file2.exists()==false) {file2.createNewFile();}
	 if(file3.exists()==false) {file3.createNewFile();}
	 

	}
}
