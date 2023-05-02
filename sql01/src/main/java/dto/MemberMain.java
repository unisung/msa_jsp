package dto;

import java.util.ArrayList;
import java.util.List;

public class MemberMain {
	public static void main(String[] args) {
	   List<Member> list = new ArrayList<>();
	   
	   Member m1 = new Member(1, "홍길동");
	   Member m2 = new Member(2, "일지매");
	   
	   list.add(m1);
	   list.add(m2);
	   
	   Member m3 = new Member(1, "홍길동");
	   
	   System.out.println(m1.hashCode());
	   System.out.println(m3.hashCode());
	   
	   
	   System.out.println(list.contains(m1));
	   System.out.println(list.contains(m3));

	}

}
