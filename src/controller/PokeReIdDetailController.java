package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.PokeDAO;
import model.PokeVO;

public class PokeReIdDetailController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,   HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession(false);
      System.out.println("1"+session);
      MemberVO vo=(MemberVO)session.getAttribute("login");
      String otherid = request.getParameter("id");
      String myid=vo.getId();
      System.out.println("2"+otherid);
      System.out.println("3"+myid);
      PokeVO mvo2=PokeDAO.getInstance().findMyIdConfirm(otherid,myid);
      System.out.println("4"+mvo2);
      
      return new ModelAndView("poke/poke_detail2.jsp","bvo2",mvo2);
   }

}