package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class ShowDetailController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		//아이디로 상세 정보 보기
		MemberVO vo=MemberDAO.getInstance().getFindMyId(id);
		
		return new ModelAndView("member/showdetail.jsp","bvo", vo);
	}

}
