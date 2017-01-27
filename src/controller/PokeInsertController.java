package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PokeDAO;

import org.json.JSONObject;

public class PokeInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String se_Id = request.getParameter("se_Id"); 
		String re_Id = request.getParameter("re_Id"); 
		PokeDAO.getInstance().pokeInsert(se_Id, re_Id); 
		JSONObject json = new JSONObject();
		return new ModelAndView("AjaxView","json",json);
	}

}
