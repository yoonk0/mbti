package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class ShowContentController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("kjkjno"+no);
		BoardVO vo = BoardDAO.getInstance().getPostingByNoNotHit(no);		
		return new ModelAndView("board/show_content.jsp","bvo", vo);
	}
}
