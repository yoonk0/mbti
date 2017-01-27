package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PokeDAO {
	   private static PokeDAO instance = new PokeDAO();
	   private DataSource dataSource;
	   private PokeDAO(){
	      dataSource=DataSourceManager.getInstance().getDataSource();
	   }
	   public static PokeDAO getInstance(){
	      return instance;
	   }
	   public Connection getConnection() throws SQLException{
	      return dataSource.getConnection();
	   }
	   public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
	      if(pstmt!=null)
	         pstmt.close();
	      if(con!=null)
	         con.close(); 
	   }
	   public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
	      if(rs!=null)
	         rs.close();
	      closeAll(pstmt,con);
	   }
	   
	   public void likePoke(int pokeNo) throws SQLException{
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   try {
			con=getConnection();
			String sql="update poke_c set confirm=? where poke_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setInt(2, pokeNo);
			pstmt.executeUpdate();
		}finally{
			closeAll(pstmt, con);
		}
	   }
	   
	   public void hatePoke(int pokeNo) throws SQLException{
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   try {
			con=getConnection();
			String sql="update poke_c set confirm=? where poke_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "2");
			pstmt.setInt(2, pokeNo);
			pstmt.executeUpdate();
		}finally{
			closeAll(pstmt, con);
		}
	   }
	   
	   
	   //내가 받은 찜에 대한 찜번호 찾기
	   public PokeVO findMyReceivePokeNo(String otherid, String myid) throws SQLException{
		   PokeVO vo=null;
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try {
			con=getConnection();
			String sql="select p.poke_no, p.se_Id , p.re_Id, p.confirm, m.kakao from member_c m, poke_c p where m.id = p.se_Id and re_Id=? and se_Id=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, myid);
			   pstmt.setString(2, otherid);
			   rs=pstmt.executeQuery();		   
			   if(rs.next()){
				   vo=new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),new MemberVO(rs.getString(5)));
			   }		   
		} finally{
			closeAll(rs, pstmt, con);
		}   
		   return vo;
	   }
	   
	 //내가 보낸 찜에 대한 찜번호 찾기
	   public ArrayList<PokeVO> findMySendPokeNo(String otherid, String myid) throws SQLException{
		   ArrayList<PokeVO> plist = new ArrayList<PokeVO>();
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try {
			con=getConnection();
			String sql="select p.poke_no, p.se_Id , p.re_Id, p.confirm, m.kakao from member_c m, poke_c p where m.id = p.se_Id and re_Id=? and se_Id=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, otherid);
			   pstmt.setString(2, myid);
			   rs=pstmt.executeQuery();		   
			  while(rs.next()){
				   //vo=new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),new MemberVO(rs.getString(5)));
				   plist.add(new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),new MemberVO(rs.getString(5))));
			   }		   
		} finally{
			closeAll(rs, pstmt, con);
		}   
		   return plist;
	   }
	   
	   
	   
	   public ArrayList<PokeVO> ReceivePokeList(String id) throws SQLException{
		   ArrayList<PokeVO> plist = new ArrayList<PokeVO>();
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try{
			   con=getConnection();
			   String sql="select p.poke_no, p.se_Id , p.re_Id, p.confirm, m.kakao from member_c m, poke_c p where m.id = p.se_Id and re_Id=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs=pstmt.executeQuery();
			   while(rs.next()){
				   plist.add(new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),new MemberVO(rs.getString(5))));
			   }
		   }finally{
			   closeAll(rs, pstmt, con);
		   }
		   return plist;
	   }
	   
	   
	   public ArrayList<PokeVO> SendPokeList(String id) throws SQLException{
		   ArrayList<PokeVO> plist = new ArrayList<PokeVO>();
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try{
			   con=getConnection();
			   String sql="select p.poke_no, p.se_Id , p.re_Id, p.confirm, m.kakao  from member_c m, poke_c p where m.id = p.re_Id and se_Id=?";
			   pstmt=con.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs=pstmt.executeQuery();
			   while(rs.next()){
				   plist.add(new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),new MemberVO(rs.getString(5))));
			   }
		   }finally{
			   closeAll(rs, pstmt, con);
		   }
		   return plist;
	   }
	   
	   public void AcceptPoke(int pokeNo) throws SQLException{
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   try{
			   con=getConnection();
			   String sql="update ";
			   pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, pokeNo);
			   pstmt.executeUpdate();
		   }finally{
			   closeAll(pstmt, con);
		   }
	   }
	   
	   
	   public void DeletePoke(int pokeNo) throws SQLException{
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   try{
			   con=getConnection();
			   String sql="delete poke_c where poke_no=?";
			   pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, pokeNo);
			   pstmt.executeUpdate();
		   }finally{
			   closeAll(pstmt, con);
		   }
	   }
	   
	      public PokeVO findMyIdConfirm(String otherid, String myid) throws SQLException{
	            PokeVO vo=null;
	            Connection con=null;
	            PreparedStatement pstmt=null;
	            ResultSet rs=null;
	            try {
	               System.out.println("dao옴?");
	               con=getConnection();
	               //String sql="select id,password,gender,age,location,job,height,hobby,picture,mbti,kakao  from member_c where id=?";
	               String sql="select p.poke_no, p.confirm, m.id,m.password,m.gender,m.age,m.location,m.job,m.height,m.hobby,m.picture,m.mbti,m.kakao from member_c m, poke_c p where m.id = p.re_Id and re_Id=? and se_Id=?";
	               pstmt=con.prepareStatement(sql);
	               System.out.println("sql실행전");
	               pstmt.setString(1, otherid);
	               pstmt.setString(2, myid);
	               rs=pstmt.executeQuery();
	               System.out.println("익스큐트 실행");
	               if(rs.next()){
	                  vo = new PokeVO(rs.getInt(1), rs.getInt(2),new MemberVO(rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13)));
	               }
	            } finally{
	               closeAll(rs, pstmt, con);
	            }
	            System.out.println(vo);
	            return vo;
	         }
	      
	      public PokeVO findMyIdConfirm2(String otherid, String myid) throws SQLException{
	            PokeVO vo=null;
	            Connection con=null;
	            PreparedStatement pstmt=null;
	            ResultSet rs=null;
	            try {
	               System.out.println("dao옴?");
	               con=getConnection();
	               //String sql="select id,password,gender,age,location,job,height,hobby,picture,mbti,kakao  from member_c where id=?";
	               String sql="select p.poke_no, p.confirm, m.id,m.password,m.gender,m.age,m.location,m.job,m.height,m.hobby,m.picture,m.mbti,m.kakao from member_c m, poke_c p where m.id = p.se_Id and re_Id=? and se_Id=?";
	               pstmt=con.prepareStatement(sql);
	               System.out.println("sql실행전");
	               pstmt.setString(1, myid);
	               pstmt.setString(2, otherid);
	               rs=pstmt.executeQuery();
	               System.out.println("익스큐트 실행");
	               if(rs.next()){
	                  vo = new PokeVO(rs.getInt(1), rs.getInt(2),new MemberVO(rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13)));
	               }
	            } finally{
	               closeAll(rs, pstmt, con);
	            }
	            System.out.println(vo);
	            return vo;
	         }
		public void pokeInsert(String seId, String reId) throws SQLException{
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{
				con=getConnection(); 
					String sql = "insert into poke_c values(poke_seq.nextval,?,?,0)";		
					pstmt=con.prepareStatement(sql);	
					pstmt.setString(1, seId);
					pstmt.setString(2, reId);
					pstmt.executeUpdate();
							
			}finally{
				closeAll(rs,pstmt,con);
			}
		}
		public PokeVO pokeCheck(String se_Id, String re_Id) throws SQLException{
			PokeVO pvo = null;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{
				con=getConnection();
				String sql2 = "select poke_no, se_Id, re_Id, confirm from Poke_c where se_Id = ? and re_Id = ?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, se_Id);
				pstmt.setString(2, re_Id);
				rs = pstmt.executeQuery(); 
			if(rs.next()){
				pvo = new PokeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)); 
			}
			}finally{
				closeAll(rs,pstmt,con);
			}
			return pvo; 
		}
	   
}



















