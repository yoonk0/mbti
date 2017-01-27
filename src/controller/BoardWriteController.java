package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberVO;

public class BoardWriteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		MemberVO vo = (MemberVO)session.getAttribute("login");
		System.out.println("타이틀:"+title+" 컨텐트:"+content+" vo:"+vo);
		BoardDAO.getInstance().write(title,content,vo);
		int no = BoardDAO.getInstance().getNo();
		String path="redirect:DispatcherServlet?command=showContentNotHit&no="+no;
		return new ModelAndView(path);
	}

}
