package dto;

public class Book {
  private String bookName;
  private String publisher;
  private int price;
  
  
  
public Book(String bookName, String publisher, int price) {
	this.bookName = bookName;
	this.publisher = publisher;
	this.price = price;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getPublisher() {
	return publisher;
}
public void setPublisher(String publisher) {
	this.publisher = publisher;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}


@Override
public int hashCode() {
	return bookName.hashCode() + publisher.hashCode();
}
@Override
public boolean equals(Object obj) {
	return bookName.equals(((Book)obj).bookName) && publisher.equals(((Book)obj).publisher);
}
@Override
public String toString() {
	return "Book [bookName=" + bookName + ", publisher=" + publisher + ", price=" + price + "]";
}
  

  
}
