package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/product/hw_p_search.do")
public class a_projduct_listok extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hw_select = request.getParameter("hw_select");
        String hw_s_word = request.getParameter("hw_s_word");
        
        a_product ap = new a_product();
        ArrayList<ArrayList<String>> result = ap.ap_data(hw_select, hw_s_word);
        
        request.setAttribute("result", result);
        
        RequestDispatcher rd =request.getRequestDispatcher("../admin/product_view.jsp");
        rd.forward(request, response);
	}

}
