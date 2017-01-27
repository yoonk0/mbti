package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
   private static MemberDAO instance = new MemberDAO();
   private DataSource dataSource;
   private MemberDAO(){
      dataSource=DataSourceManager.getInstance().getDataSource();
   }
   public static MemberDAO getInstance(){
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
   
   public MemberVO login(String id, String password) throws SQLException{
       MemberVO vo=null;
       Connection con = null;
       PreparedStatement pstmt= null;
       ResultSet rs=null;
       try{
          con=getConnection();
          String sql="select id, password,gender,age,location,job,height,hobby,admin,picture,mbti,kakao from member_c where id=? and password=?";
          pstmt=con.prepareStatement(sql);
          pstmt.setString(1, id);
          pstmt.setString(2, password);
          rs=pstmt.executeQuery();
          if(rs.next()){
             vo=new MemberVO(rs.getString("id"), rs.getString("password"), rs.getString("gender"), 
                   rs.getInt("age"), rs.getString("location"), rs.getString("job"), rs.getInt("height"), 
                   rs.getString("hobby"),rs.getInt("admin"), rs.getString("picture"), rs.getString("mbti"), rs.getString("kakao"));
          }
       }finally{
          closeAll(rs, pstmt, con);
       }
       return vo;
    }
   //멤버 수정
   public void memberUpdate(MemberVO vo) throws SQLException{
      Connection con=null;
      PreparedStatement pstmt=null;
      try {
    	  System.out.println("dao시작부분");
         con=getConnection();
         String sql="update member_c set password=?,gender=?,age=?,location=?,job=?,height=?,hobby=?,picture=?,mbti=?,kakao=? where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, vo.getPassword());
         pstmt.setString(2, vo.getGender());
         pstmt.setInt(3, vo.getAge());
         pstmt.setString(4, vo.getLocation());
         pstmt.setString(5, vo.getJob());
         pstmt.setInt(6, vo.getHeight());
         pstmt.setString(7, vo.getHobby());
         pstmt.setString(8, vo.getPicture());
         pstmt.setString(9, vo.getMbti());
         pstmt.setString(10, vo.getKakao());
         pstmt.setString(11, vo.getId());

         pstmt.executeUpdate();

      } finally{
         closeAll(pstmt, con);
      }
   }
   
  
   
   
   
   //내 아이디로 정보 보기
   public MemberVO getFindMyId(String id) throws SQLException{
      MemberVO vo=null;
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         con=getConnection();
         String sql="select id,password,gender,age,location,job,height,hobby,picture,mbti,kakao  from member_c where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         if(rs.next()){
            vo=new MemberVO(rs.getString("id"), rs.getString("password"), rs.getString("gender"), 
                  rs.getInt("age"), rs.getString("location"), rs.getString("job"), rs.getInt("height"), 
                  rs.getString("hobby"), rs.getString("picture"), rs.getString("mbti"), rs.getString("kakao"));
         }
      } finally{
         closeAll(rs, pstmt, con);
      }
      return vo;
   }
   public boolean idcheck(String id) throws SQLException{
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      boolean flag = false;
	      try{
	         con = dataSource.getConnection();
	         String sql = "select id  from member_c where id=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            flag = true;
	         }
	      }finally{
	         closeAll(rs, pstmt, con);
	      }
	      return flag;
	   }
	   

	   public void register(String id, String password, String gender, int age, String location, String job, int height, String hobby,String path, String mbti, String kakao) throws SQLException{
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      try{
	         con = dataSource.getConnection();
	         String sql = "insert into member_c values(?,?,?,?,?,?,?,?,?,?,?,?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, password);
	         pstmt.setString(3, gender);
	         pstmt.setInt(4, age);
	         pstmt.setString(5, location);
	         pstmt.setString(6, job);
	         pstmt.setInt(7, height);
	         pstmt.setString(8,hobby);
	         pstmt.setInt(9, 0);
	         pstmt.setString(10, path);
	         pstmt.setString(11, mbti);
	         pstmt.setString(12, kakao);
	         
	         pstmt.executeUpdate();
	      }finally{
	         closeAll(pstmt, con);
	      }
	   }
}