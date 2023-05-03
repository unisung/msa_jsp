package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.BoardDTO;
import mvc.database.DBConnection;

public class BoardDAO {
  private static BoardDAO instance=new BoardDAO();

public static BoardDAO getInstance() {
	return instance;
}

//board 테이블 레코드 개수
public int getListCount(String items, String text) {
	 Connection conn=null; Statement pstmt=null; ResultSet rs=null;
     //검색조건에 해당하는 글의 전체 갯수 추출 
	 int x=0;  
	 String sql="";
	  
	  if(items==null && text==null)//검색버튼을 누르지 않았거나 처음에 페이지를 열때
		  sql="select count(*) from board order by num desc ";
	  else//검색버튼을 눌렀을 때 혹은 검색어가 없을 때
		  sql="select count(*) from board where "+items+" like '%"+text+"%' order by num desc ";
	  
	  System.out.println("검색항목:"+ items);
	  System.out.println("검색어:"+ text);
	  System.out.println("sql:"+ sql);
	  
	  try {
		   //db연결 
		   conn = DBConnection.getConnection();
		   pstmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				                        ResultSet.CONCUR_READ_ONLY);
		   rs = pstmt.executeQuery(sql);
		   //전체 건수
		 while(rs.next()) {
			 x=rs.getInt(1);
		 }
	  }catch(Exception e) {e.printStackTrace();} 
	  
	return x;
}

//board 테이블의 레코드 가져오기
  public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
	  Connection conn=null; Statement pstmt=null; ResultSet rs=null;
	  //(검색 후)전체 글 갯수
	  int total_record = getListCount(items, text);
	  //파라미터로 넘어온 페이지 -1 한 값에 페이지당 글 갯수 곱하기하면 시작글 번호가 나옴.
	  int start = (page -1) *limit;
	  int index = start+1;
	  System.out.println("index: "+index);
	  System.out.println("start: "+start);
	  System.out.println("limit: "+limit);
	  System.out.println("total_record: "+total_record);
	  
	  String sql="select * from board order by num desc ";
	  
	  if(items==null && text==null)//검색버튼을 누르지 않았거나 처음에 페이지를 열때
		  sql="select * from board order by num desc ";
	  else//검색버튼을 눌렀을 때 혹은 검색어가 없을 때
		  sql="select * from board where "+items+" like '%"+text+"%' order by num desc ";
	  
	  System.out.println("검색항목:"+ items);
	  System.out.println("검색어:"+ text);
	  System.out.println("sql:"+ sql);
	  
	  //개별 글을 저장할 글목록 객체 list
	  ArrayList<BoardDTO> list = new ArrayList<>();
	  
	  try {
		   //db연결 
		   conn = DBConnection.getConnection();
		   pstmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				                        ResultSet.CONCUR_READ_ONLY);
		   rs = pstmt.executeQuery(sql);
		   
		 while(rs.absolute(index)) {
			 int cnt=0;
			 BoardDTO board = new BoardDTO();
			 board.setNum(rs.getInt(++cnt));
			 board.setId(rs.getString(++cnt));
			 board.setName(rs.getString(++cnt));
			 board.setSubject(rs.getString(++cnt));
			 board.setContent(rs.getString(++cnt));
			 board.setRegist_day(rs.getString(++cnt));
			 board.setHit(rs.getInt(++cnt));
			 board.setIp(rs.getString(++cnt));
			 
			 //한번 반복시마다 객체 생성하여 list에 저장
			 list.add(board);
			 System.out.println("board:"+board);
			 //index가 범위를 벗어나면 break;
			 if(index <(start+limit) && index <= total_record)
				  index++;
			 else
				 break;
		 }
		 //글이 담긴 리스트 리턴
		    return list;
	  }catch(Exception e) {
		 System.out.println("getBoardList()에러: "+e);  
	  }
	  return null;
  }
  
}
