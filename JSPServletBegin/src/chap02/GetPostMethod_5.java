package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetPostMethod_5
 */
@WebServlet("/getpostMethod_5.do")
public class GetPostMethod_5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		// response.getWriter() => 웹 프라우저상에 기술할 수 있는 객체를 얻어오는것을 의미.
		// append()는 print와 비슷한 의미이다.
		// request.getContextPath(); => context명을 읽어오는 것
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		// HttpServletRequest request : 전송되어져 온 데이터를 처리해주는 용도로 쓰인다.

		// request.setCharacterEncoding("UTF-8");
		// getParameter은 반환값이 String형으로, 값이 단일값으로 넘어온다.
		String name = request.getParameter("name"); // 이름의 name 속성

		String school = request.getParameter("school"); // 학력의 name 속성
		String color = request.getParameter("color"); // 좋아하는 색상의 name 속성

		// getParameterValues는 반환값이 String[] 형으로, 값이 다중값으로 넘어온다.
		String[] foodArr = request.getParameterValues("food"); // 좋아하는 음식의 name
																// 속성

		// 콘솔에 출력하기
		System.out.println("name =>" + name);
		System.out.println("school =>" + school);

		if (color == null) {
			color = "없음";
		}
		System.out.println("color =>" + color);

		if (foodArr != null) {
			for (int i = 0; i < foodArr.length; i++) {
				System.out.println("foodArr[" + i + "]의 값 => " + foodArr[i]);
			}
		}

		// 웹브라우저에 출력하기 시작
		// HttpServletResponse response 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할때 쓰인다.
		response.setContentType("text/html; charset=UTF-8");

		// 클라이언트에서 넘어온 method 방식의 GET 인지, POST 인지 알아오기.
		String method = request.getMethod(); // Get or Post 방식이 나온다,
		// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head><title>개인 성향 테스트 결과화면</title></head>");
		out.println("<body>");
		out.println("<h2>개인 성향 테스트 결과(" + method + ")</h2>");
		out.printf("<span style='color: yellow; font-weight: bold;'>%s</span>님의 개인 성향은<br/><br/>", name);

		if (!"없음".equals(color)) {
			out.printf("학력은 %s이며, %s색을 좋아합니다.<br/><br/>", school, color);
		} else {
			out.printf("학력은 %s이며, 좋아하는 색이 없습니다.<br/><br/>", school);
		}

		if (foodArr != null) {
			String foodes = String.join(",", foodArr);
			out.println("좋아하는 음식은" + foodes + " 입니다.");
		} else {
			out.println("좋아하는 음식이 없습니다.");
		}
		out.println("</body>");
		out.println("</html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
