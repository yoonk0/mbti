package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardService;
import model.ListVO;

public class ListController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String pageNo=request.getParameter("pageNo");
		System.out.println(pageNo);
		ListVO lvo = BoardService.getInstance().getPostingList(pageNo);
		System.out.println(lvo);
		return new ModelAndView("board/list.jsp","lvo",lvo);	
	}

}
