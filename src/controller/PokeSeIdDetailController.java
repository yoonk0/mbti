package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.PokeDAO;
import model.PokeVO;

public class PokeSeIdDetailController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession(false);
      MemberVO vo=(MemberVO)session.getAttribute("login");
      String otherid = request.getParameter("id");
      String myid=vo.getId();
/*      MemberVO mvo = MemberDAO.getInstance().getFindMyId(myid);      
      System.out.println(myid);*/
      PokeVO mvo=PokeDAO.getInstance().findMyIdConfirm2(otherid,myid);
      System.out.println(mvo);
      
      return new ModelAndView("poke/poke_detail.jsp","bvo",mvo);
   }

}