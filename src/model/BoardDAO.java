package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private static DataSource dataSource;
	private BoardDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BoardDAO getInstance(){
		return instance;
	}
	public static Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public static void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	public static void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt,con);
	}
	  public static ArrayList<BoardVO> getPostingList(int pn) throws SQLException {
	      ArrayList<BoardVO> list=new ArrayList<BoardVO>();
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try{
	         con=getConnection(); 
	         String sql = "select b.post_no,m.id, m.password ,b.title,b.time_posted,b.page from (select post_no,id,title,time_posted,ceil(rownum/5) as page from(select post_no,id,title,to_char(time_posted,'YYYY.MM.DD') as time_posted from board_c order by post_no desc)) b, member_c m where b.id = m.id and page=?";
	         pstmt=con.prepareStatement(sql);  
	         System.out.println(1);
	         pstmt.setInt(1, pn);
	         System.out.println(2);
	         rs=pstmt.executeQuery(sql);   
	         System.out.println(4);
	         while(rs.next()){   
	            list.add(new BoardVO(rs.getInt(1),new MemberVO(rs.getString(2), rs.getString(3)),rs.getString(4),rs.getString(5),rs.getInt(6)));
	         }      
	         return list;
	      }finally{
	         closeAll(rs,pstmt,con);
	      }
	   }
	   
	
	
	public int getTotalPostingCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
		int count=0;
		try{
			con=getConnection(); 
			String sql="select count(*) from board_c";
			pstmt=con.prepareStatement(sql);			
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return count;
	}	
	public void write(String title, String content, MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
		try{
			con=getConnection(); 
			String sql = "insert into board_c(post_no, title, content, time_posted, id) values(board_c_seq.nextval, ?, ?, sysdate, ?)";
			pstmt=con.prepareStatement(sql);	
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, vo.getId());
			pstmt.executeUpdate();
		}finally{
			closeAll(rs,pstmt,con);
		}
	}
	public int getNo() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int no = 0;
		try{
			//dataSource(DBCP)로부터 컨넥션을 빌려온다.
			con = dataSource.getConnection();
			String sql = "select board_c_seq.currval from dual";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
			return no;
		}finally{
			closeAll(rs, pstmt, con);
		}	
	}
	  public BoardVO getPostingByNoNotHit(int no) throws SQLException {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;   
	      BoardVO vo = null;
	      try{
	         con=getConnection(); 
	         String sql="select b.post_no,b.title,b.content,b.time_posted,m.id,m.password from member_c m, board_c b where m.id=b.id and b.post_no =?";
	         pstmt=con.prepareStatement(sql);   
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	            vo = new BoardVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),new MemberVO(rs.getString(5),null));
	         }
	         return vo;
	      }finally{
	         closeAll(rs,pstmt,con);
	      }
	   }
	public void updatePosting(int no, String title, String content) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getConnection();
			String sql="update board_c set title=?,content=? where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);		
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt,con);
		}
		
	}
	
	
	public ArrayList<MemberVO> searchMemberList(String location, int age, String[] mbti, int pageNo, String id)
			throws SQLException{
		ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 2; 
		try{
			con=getConnection(); 
				StringBuilder sql=new StringBuilder();
				sql.append("select page, id, picture, age, location, mbti, admin, gender, job, height, hobby from ");				
				sql.append("(select ceil(rownum/3) as page, id, picture, age, location, mbti, admin, gender, job, height, hobby from ");
				sql.append("(select id, picture, age, location, mbti, admin, gender, job, height, hobby ");
				sql.append("from MEMBER_C) ");
				sql.append("where admin = 0 and id != ?");
				if(mbti != null){
				for(int i=0; i<mbti.length; i++){
				sql.append("and mbti like ? ");
				}
				}
				if(age != 0){
					sql.append("and age >= ? and age < ? ");
				}
				if(location != ""){
					sql.append("and location = ?");
				}
				sql.append(")");
				pstmt=con.prepareStatement(sql.toString());	
				pstmt.setString(1, id);
				if(mbti != null){
				for(int i=0; i<mbti.length; i++){			
					pstmt.setString(count, "%"+mbti[i]+"%");
					count = count+1;
				}
				}
				if(age != 0){
					pstmt.setInt(count, age);
					pstmt.setInt(count+1, age+5);
					count = count+2;
				}
				if(location != ""){
					pstmt.setString(count,location);
				}
			rs=pstmt.executeQuery();	
			while(rs.next()){		
				list.add(new MemberVO(rs.getString("id"), rs.getInt("age"), rs.getString("location"), 
						rs.getString("picture"),rs.getString("mbti"),rs.getInt("page"), rs.getString("gender"),
						rs.getString("hobby"), rs.getString("job"), rs.getInt("height")));		
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return list;
	}
}
