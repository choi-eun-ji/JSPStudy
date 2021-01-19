package mystudy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/el03.do")
public class El03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstNum = request.getParameter("firstNum");
		String secondNum = request.getParameter("secondNum");
		
		int nfirstNum = Integer.parseInt(firstNum);
		int nsecondNum = Integer.parseInt(secondNum);
		
		int sum = 0;
		for(int i=nfirstNum; i<=nsecondNum; i++){
			sum += i;
		}
		
		request.setAttribute("firstNum", firstNum);
		request.setAttribute("secondNum", secondNum);
		request.setAttribute("sum", sum);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mystudy/03el_view.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
