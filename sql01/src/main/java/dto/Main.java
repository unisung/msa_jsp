package dto;

import java.util.ArrayList;
import java.util.List;

public class Main {
	public static void main(String[] args) {
        List<Book> books = new ArrayList<>();
		Book book = new Book("축구의 역사", "굿스포츠", 7000);
		books.add(book);
		
		System.out.println(books.contains(book)?"있음":"없음");
		System.out.println(books.contains(new Book("축구의 역사", "굿스포츠", 7000))?"있음":"없음");
     
	}
}
