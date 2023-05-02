package dto;

public class Member {
  private int sno;
  private String name;
  
public int getSno() {
	return sno;
}
public void setSno(int sno) {
	this.sno = sno;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Member(int sno, String name) {
	this.sno = sno;
	this.name = name;
}
@Override
public int hashCode() {
	return 1;
}
@Override
public boolean equals(Object obj) {
	return sno==((Member)obj).sno;
}


 

  
}
