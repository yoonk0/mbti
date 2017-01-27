package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class UpdateViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no=Integer.parseInt(request.getParameter("no"));
		BoardVO vo = BoardDAO.getInstance().getPostingByNoNotHit(no);		
		return new ModelAndView("/board/update.jsp", "bvo", vo);
	}

}
