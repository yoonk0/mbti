package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.PokeDAO;
import model.PokeVO;

public class PokeOkController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

       HttpSession session = request.getSession(false);
       MemberVO vo=(MemberVO)session.getAttribute("login");
      String otherid=request.getParameter("id");
      String myid=vo.getId();
      PokeVO pvo=PokeDAO.getInstance().findMyReceivePokeNo(otherid, myid);
      int pokeNo=pvo.getPokeNo();
      PokeDAO.getInstance().likePoke(pokeNo);
      
      
        return new ModelAndView("poke/poke_list.jsp");
   }
}
