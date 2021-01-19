package chap05.oracle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.DocumentationTool.Location;

/**
 * Servlet implementation class PersonUpdate2
 */
@WebServlet("/personUpdate2.do")
public class PersonUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InterPersonDAO dao = new PersonDAO();
	   
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String method = request.getMethod();
	      
	      if("GET".equals(method)){
	         RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/chap05_oracle/personChange.jsp");
	         dispatcher.forward(request, response);
	      }
	      else{
	         int seq = Integer.parseInt(request.getParameter("seq"));
	         String name = request.getParameter("name");
	         String school = request.getParameter("school");
	         String color = request.getParameter("color");
	         String[] foodArr = request.getParameterValues("food");
	         
	         PersonDTO psdto = new PersonDTO();
	         psdto.setName(name);
	         psdto.setSchool(school);
	         psdto.setColor(color);
	         psdto.setFood(foodArr);
	         psdto.setSeq(seq);
	         
	         String pathName = "";
	         
	         try {
	               int n = dao.personUpdate(psdto, seq);
	               
	               if(n == 1){
	                  //pathName = "/WEB-INF/chap05_oracle/personRegister_ok.jsp";
	                  //RequestDispatcher dispatcher = request.getRequestDispatcher(pathName);
	     	          //dispatcher.forward(request, response);
	            	  
	            	  // request는 forward 방식 response는 그냥 페이지만 이동
	            	  response.sendRedirect("personSelect.do");	// 상대경로를 주로 써줘야 한다.!
	            	  //response.sendRedirect("이동해야 할 url 주소"); ==> 이동해야 할  url 주소로 페이지 이동만 일어난다. 
	            	  
	               }
	               else {
	                  pathName = "/WEB-INF/chap05_oracle/personRegister_fail.jsp";
	                  RequestDispatcher dispatcher = request.getRequestDispatcher(pathName);
	     	          dispatcher.forward(request, response);
	               }
	            } catch (SQLException e) {
	               //e.printStackTrace();
	               pathName = "/WEB-INF/chap05_oracle/sqlerror.jsp";
	               RequestDispatcher dispatcher = request.getRequestDispatcher(pathName);
	  	           dispatcher.forward(request, response);
	            }
	         //RequestDispatcher dispatcher = request.getRequestDispatcher(pathName);
	         //dispatcher.forward(request, response);
	      }
	   }

	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doGet(request, response);

	}

}
