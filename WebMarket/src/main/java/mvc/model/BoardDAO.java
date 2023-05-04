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
  }//리스트 출력
  
  //로그인한 id로 name 추출
  public String  getLoginNameById(String id){
	  Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
		 String sql="select name from member where id=?";
		 System.out.println("sql:"+ sql);
	  String name=""; 
		  try {
			   //db연결 
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1,id);
			   
			   rs = pstmt.executeQuery();
			   //전체 건수
			 while(rs.next()) {
				 name=rs.getString(1);
			 }
		  }catch(Exception e) {e.printStackTrace();} 
		  
		return name; //db에서 추출한 name 리턴
  }//
 //게시글 등록 
  public void insertBoard(BoardDTO board){
	  Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
		 String sql="insert into board(id,name,subject,content,regist_day,hit,ip) "
		 		+ " values(?,?,?,?,?,?,?) ";
		 System.out.println("sql:"+ sql);
	  String name=""; 
		  try {
			   //db연결 
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
               //파라미터값 binding
			   int index=0;
			   pstmt.setString(++index,board.getId());
			   pstmt.setString(++index,board.getName());
			   pstmt.setString(++index,board.getSubject());
			   pstmt.setString(++index,board.getContent());
			   pstmt.setString(++index,board.getRegist_day());
			   pstmt.setInt(++index,board.getHit());
			   pstmt.setString(++index,board.getIp());
			   //db 저장
			   pstmt.executeUpdate();
			   
		  }catch(Exception e) {e.printStackTrace();} 
  }//게시글 등록

public BoardDTO getBoardByNum(int num) {
	  //조회수 증가
	   updateBoardHit(num);
	   
	Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
	 String sql="select * from board where num=?";
    System.out.println("sql:"+ sql);
    BoardDTO board=null;
    
	  try {
		   //db연결 
		   conn = DBConnection.getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1,num);
		   
		   rs = pstmt.executeQuery();
		  //board 정보 생성
		 while(rs.next()) {
			 board = new BoardDTO();
			 board.setNum(num);//넘어온 파라미터로 설정
			 board.setId(rs.getString("id"));
			 board.setName(rs.getString("name"));
			 board.setSubject(rs.getString("subject"));
			 board.setContent(rs.getString("content"));
			 board.setHit(rs.getInt("hit"));
			 board.setRegist_day(rs.getString("regist_day"));
			 board.setIp(rs.getString("ip"));
		 }
	  }catch(Exception e) {e.printStackTrace();} 

	return board;//BoardDTO객체 리턴
}
 //게시글 조회수 증가
public void updateBoardHit(int num){
	  Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
		 String sql="update board set hit = hit+1 where num=?";
		 System.out.println("sql:"+ sql);
		  try {
			   //db연결 
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1,num);
			   //db 저장
			   pstmt.executeUpdate();
		  }catch(Exception e) {e.printStackTrace();} 
}//조회수 증가

public void updateBoard(BoardDTO board) {
	  Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
		 String sql="update board"
		 		+ "     set subject=?,"
		 		+ "         content=? "
		 		+ "   where num=?";
		 System.out.println("sql:"+ sql);
		  try {
			   //db연결 
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
             //파라미터값 binding
			   int index=0;
			   
			   pstmt.setString(++index,board.getSubject());
			   pstmt.setString(++index,board.getContent());
			   pstmt.setInt(++index,board.getNum());
			   //db 저장
			   pstmt.executeUpdate();
			   
		  }catch(Exception e) {e.printStackTrace();} 
}
//게시글 삭제 처리
public void deleteBoard(int num) {
	Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
	 String sql="delete from board where num=?";
	 System.out.println("sql:"+ sql);
	  try {
		   //db연결 
		   conn = DBConnection.getConnection();
		   pstmt = conn.prepareStatement(sql);
           //파라미터값 binding
		   pstmt.setInt(1,num);
		   //db 저장
		   pstmt.executeUpdate();
		   
	  }catch(Exception e) {e.printStackTrace();} 
}//삭제 처리

}
