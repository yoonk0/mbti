package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

import org.json.JSONObject;

public class IDCheckController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      boolean flag = MemberDAO.getInstance().idcheck(id);
      JSONObject json=null;
      if(flag == false){
         json = new JSONObject();
         json.put("flag", "N");

      }else{
         json = new JSONObject(flag);
         json.put("flag", "T");
      }
      return new ModelAndView("AjaxView","json",json);
   }

}