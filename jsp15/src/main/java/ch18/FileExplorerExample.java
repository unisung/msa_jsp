package ch18;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileExplorerExample {
	public static void main(String[] args) {
		File temp = new File("c:/temp");
		File[] contents = temp.listFiles();//디렉토리의 파일 & 디렉토리 리스트 추출
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm");
		for(File file:contents) {
			System.out.printf("%-25s", sdf.format(new Date(file.lastModified())));//생성혹은 수정된 시점
			if(file.isDirectory()) {//디렉토리 여부
				System.out.printf("%-10s%-20s", "<DIR>",file.getName());//디렉토리나 파일명
			}else {
				System.out.printf("%-10s%-20s", file.length(), file.getName());//파일사이즈 length()
			}
			System.out.println();
		}
	}
}
