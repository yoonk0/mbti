package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

public class BoardUpdateController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no=Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardDAO.getInstance().updatePosting(no,title,content);			
		String path="redirect:DispatcherServlet?command=showContentNotHit&no="+no;
		return new ModelAndView(path);
	}

}
