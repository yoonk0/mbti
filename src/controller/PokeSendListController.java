package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.PokeDAO;
import model.PokeVO;

public class PokeSendListController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      ArrayList<PokeVO> selist = PokeDAO.getInstance().SendPokeList(id);
      JSONArray arr=new JSONArray(selist);
      
      return new ModelAndView("AjaxView","json",arr);
   }

}