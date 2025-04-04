package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class a_projduct_listok extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String pageno = req.getParameter("pageno");
		if(pageno == null || pageno.equals("1")) {	//최초 해당 게시판에 접속시 페이지 배열번호 0로 처리
			pageno = "0";
		}
		
		
		String hw_select = req.getParameter("hw_select");
        String hw_s_word = req.getParameter("hw_s_word");
        
        a_product ap = new a_product(Integer.parseInt(pageno));
        ArrayList<ArrayList<String>> result = ap.ap_data(hw_select, hw_s_word);
        
        req.setAttribute("result", result);
        
        RequestDispatcher rd =req.getRequestDispatcher("../product/product_view.jsp");
        rd.forward(req, resp);
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String pageno = request.getParameter("pageno");
			if(pageno == null || pageno.equals("1")) {	//최초 해당 게시판에 접속시 페이지 배열번호 0로 처리
				pageno = "0";
			}
		
		String hw_select = request.getParameter("hw_select");
        String hw_s_word = request.getParameter("hw_s_word");
        
        a_product ap = new a_product();
        ArrayList<ArrayList<String>> result = ap.ap_data(hw_select, hw_s_word);
        
        request.setAttribute("result", result);
        
        RequestDispatcher rd =request.getRequestDispatcher("../product/product_view.jsp");
        rd.forward(request, response);
	}

}
