package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardService;
import model.List2VO;

import org.json.JSONObject;

public class SearchController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String pageNo=request.getParameter("pageNo");
		int age = 0;
		String a = request.getParameter("age");
		if(a != "")
			age = Integer.parseInt(a);
		String location = request.getParameter("location");
		String id = request.getParameter("id");
		String mbti = request.getParameter("mbti");
		String [] mbti2 = null;
		if(mbti != null)
			 mbti2 = mbti.split(","); 
		List2VO lvo= BoardService.getInstance().searchMembers(location, age, mbti2, pageNo, id);
		
		JSONObject json = new JSONObject(lvo); 
		return new ModelAndView("AjaxView","json", json);
	}

}
