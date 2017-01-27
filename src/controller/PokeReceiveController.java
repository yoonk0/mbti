package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.PokeDAO;
import model.PokeVO;

public class PokeReceiveController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      String id=request.getParameter("id");
      System.out.println(id+"아아");
      ArrayList<PokeVO> relist = PokeDAO.getInstance().ReceivePokeList(id);
      System.out.println(relist+"아아");
      JSONArray arr = new JSONArray(relist);   
      
      return new ModelAndView("AjaxView","json",arr);
   }
}