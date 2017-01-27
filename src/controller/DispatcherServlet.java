package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		requestProcess(request, response);
	}
	public void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = null;
		ModelAndView mv = null;
		Controller c = null;
		try{
			command = request.getParameter("command");
			c = HandlerMapping.getInstance().create(command);
			mv = c.execute(request, response);
			if(mv.getViewName().startsWith("redirect:")){
				response.sendRedirect(mv.getViewName().substring(9));
			}else{
				HashMap<String, Object> map = mv.getMap();
				if(map.isEmpty() == false){
					Set<String> set = map.keySet();
					Iterator<String> it = set.iterator();
					while(it.hasNext()){
						String key = it.next();
						Object value = map.get(key);
						request.setAttribute(key, value);
					}
				}
				request.getRequestDispatcher(mv.getViewName()).forward(request, response);
			}
	
		}catch(Exception e){
			e.getStackTrace();
			//response.sendRedirect("error.jsp");
		}
	}


}
