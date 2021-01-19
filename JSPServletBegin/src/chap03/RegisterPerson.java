package chap03;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
@WebServlet("/registerPerson.do")
public class RegisterPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod();	// GET 또는 POST 
		// post 방식 이라면!
		if("POST".equalsIgnoreCase(method)){
			
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			
			String[] arrFood = request.getParameterValues("food");
			String foods = String.join(",", arrFood);
			
			// 저장소에 저장시켜야 한다. 
			/*request.setAttribute("name",name);
			request.setAttribute("school", school);
			request.setAttribute("color", color);
			request.setAttribute("foods",foods);*/
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("school", school);
			paraMap.put("color", color);
			paraMap.put("foods", foods);
			
			request.setAttribute("paraMap", paraMap);
			
			// MVC 패턴 => Model단 (데이터베이스와 연결하는 클래스 DAO) + View단 (JSP), Controller단 (Servlet)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chap03_StandardAction/04forwardRegisterView.jsp");
			dispatcher.forward(request, response);				
		}
		// get 방식이라면!!
		else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/error.jsp");
			dispatcher.forward(request, response);	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
