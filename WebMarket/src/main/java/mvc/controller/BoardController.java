package mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;
import mvc.model.BoardDAO;


public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;//상수 -페이지당 글 게시 수 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println("URL:"+request.getRequestURL());
		System.out.println("QueryString:"+request.getQueryString());
		System.out.println("URI"+request.getRequestURI());
		System.out.println("contextPath:"+request.getContextPath());
		System.out.println("contextPath길이:"+request.getContextPath().length());
		System.out.println("command: "+command);
		
		//생성할 웹페이지의 MIME type
		response.setContentType("text/html; charset=utf-8");
		//para-meter의 값을 현재 페이지(서블릿)의 환경에 맞게 설정
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardWriteForm.do")) {
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request);
			//게시글 저장 후 리스트페이지로 이동 forwar의 연장이 아니고, 새로운 list페이지 출력으로 되어야함.
			response.sendRedirect("/WebMarket/BoardListAction.do");
		}else if(command.equals("/BoardViewAction.do")) {
			requestBoardView(request);//게시글 상세페이지
		    RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardUpdateAction.do")) {
			requestBoardUpdate(request);//게시글 수정
			response.sendRedirect("/WebMarket/BoardListAction.do");
		}else if(command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);//게시글 삭제
			response.sendRedirect("/WebMarket/BoardListAction.do");
		}
		
	}
	
	private void requestBoardDelete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();		
		//db 저장 처리
		dao.deleteBoard(num);
	}

	private void requestBoardUpdate(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		//작성일자
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new Date());
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());// -Djava.net.preferIPv4Stack=true
		
		//db 저장 처리
		dao.updateBoard(board);
	}

	//게시글 정보 가져오기
	private void requestBoardView(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = dao.getBoardByNum(num);//BoardDAO로 부터 받은 BoardDTO정보를 request에 저장
		request.setAttribute("board", board);//view.jsp로 이동시 request가 전달함.  
		request.setAttribute("pageNum",pageNum);
	}

	private void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		System.out.println("id:"+board.getId());
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		System.out.println("id:"+request.getParameter("id"));
		System.out.println("name:"+request.getParameter("name"));
		System.out.println("subject:"+request.getParameter("subject"));
		System.out.println("content:"+request.getParameter("content"));
		//작성일자
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new Date());
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());// -Djava.net.preferIPv4Stack=true
		
		//db 저장 처리
		dao.insertBoard(board);
		
	}

	//사용자명 가져오기
    private void requestLoginName(HttpServletRequest request) {
		String id=request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name=dao.getLoginNameById(id);
		request.setAttribute("name", name);//writeForm.jsp로 이동시 request가 전달함.
	}

	//등록된 글 가져오기
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<>();
		
		int pageNum=1;//최초 페이지 번호 설정
		int limit = LISTCOUNT;//페이지 당 글 갯수
		
		if(request.getParameter("pageNum")!=null) //파라미터로 페이지 번호가 넘어오면 넘어온 페이지로 설정
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String items=request.getParameter("items");//검색 항목 넘어오면
		String text = request.getParameter("text");//검색 어 
		
		//items와 text가 null이거나, 빈문자열("")인경우 모두 null로 처리
		items=(items==null || items.isEmpty())?null:items; //""
		text=(text==null || text.isEmpty())?null:text;
		
		System.out.println("pageNum:"+pageNum);
		System.out.println("items:"+items);
		System.out.println("text:"+text);
		
		//검색버튼을 눌렀을 때 처리
		int total_record = dao.getListCount(items,text);//count는 페이징처리
		boardlist = dao.getBoardList(pageNum, limit, items, text);//pageNum, limit 페이징처리, items,text-검색용
		
		//페이징 처리
		int total_page=0;//전체 페이지
		//예) 325개의 글을 가져와서 한 페이지당 5개씩 잘라서 보여줌. 326/5 = 65페이지, 나머지는 0
		if(total_record % limit==0) { 
			total_page = total_record/limit;//페이지수 65
			Math.floor(total_page);
			System.out.println("total_page:"+ total_page);
		}else {//예) 327개의 글을 가져와서 한 페이지당 5개씩 잘라서 보여줌. 325/5 = 65페이지, 나머지는 2 <- 한페이지에 추가
			total_page = total_record/limit;//페이지수 65
			Math.floor(total_page);
			total_page = total_page +1;//자투리 글을 위한 페이지 하나 추가 - 66페이지
			System.out.println("total_page:"+ total_page);
		}
		
		int total_seg = 0;
		
		if(total_record % limit==0) { 
			total_seg = total_page/limit;//세그먼트 갯수 7
			Math.floor(total_seg);
			System.out.println("total_seg:"+ total_seg);
		}else {//예) 65페이지를 가져와서 한 세그멘트당 10개씩 잘라서 보여줌. 65/10 = 6세그먼트, 나머지는 3 <- 한 세그먼트 추가
			total_seg = total_page/limit;//세그먼트 수 7
			Math.floor(total_seg);
			total_seg = total_seg +1;//자투리 페이지를 위한 세그먼트 하나 추가 - 7세그먼트
			System.out.println("total_seg:"+ total_seg);
		}
		
		//pageNum이 속한 segment 구하기  예) 7페이지 - 1segment, 36페이지-3segment
		int endPage = (( (pageNum - 1) / limit ) + 1 ) * limit;// 6/10 =>0 +1 => 1*10 = 10, 36-1=>35/10=3 + 1, 4*10=40
		int startPage = ((pageNum-1)/limit) * limit + 1;// 6/10 = 0*10=>0 + 1=>1, 35/10=> 3, 3*10=>30+1=> 31
				 
		
		
		System.out.println("total_page:"+ total_page);
		System.out.println("total_seg:"+ total_seg);
		System.out.println("start:"+ startPage);
		System.out.println("endPage:"+ endPage);
		
		System.out.println(boardlist.size());
		//view로 전달
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);	
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
		//검색항목 & 검색 단어
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		//segment
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		//페이지당 글 개수와 segment당 페이지 갯수 값 
		request.setAttribute("limit", limit);
		
			
	}
}
