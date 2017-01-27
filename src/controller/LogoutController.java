package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession();
      if(session != null){
         session.invalidate();
      }
      return new ModelAndView("index.jsp");
   }

}