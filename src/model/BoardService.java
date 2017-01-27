package model;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 모델 계층의 비즈니스 로직을 담당하는 객체 <br>
 * 여러 데이터 액세스 로직을 조합해 비즈니스를 정의한다 
 * @author KOSTA-00-KANGSA
 *
 */
public class BoardService {
	private static BoardService service=new BoardService();
	private BoardDAO dao;
	private BoardService(){
		dao=BoardDAO.getInstance();
	}
	public static BoardService getInstance(){
		return service;
	}
	
	public List2VO searchMembers(String location, int age, String[] mbti, String pageNo, String id) throws SQLException {
		int pn=1;
		if(pageNo!=null){
			pn=Integer.parseInt(pageNo);
		}
		ArrayList<MemberVO> list=dao.searchMemberList(location,age,mbti,pn, id);
		int searchCount = list.size();
		PagingBean pagingBean=new PagingBean(searchCount, pn);
		return new List2VO(list,pagingBean);
	}
	
	
	   public ListVO getPostingList(String pageNo) throws SQLException {
		      int pn=1;
		      if(pageNo!=null){
		         pn=Integer.parseInt(pageNo);
		      }
		      
		      ArrayList<BoardVO> list=BoardDAO.getPostingList(pn);
		      int total=dao.getTotalPostingCount();
		      System.out.println(total);
		      PagingBean pagingBean=new PagingBean(total,pn);
		      return new ListVO(list,pagingBean);
		   }
}
