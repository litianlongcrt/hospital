package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Fee;
import crt.dao.FeeDAO;

public class SelectMoneyByPnoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			String pno = req.getParameter("pno");
			if("".equals(pno)||pno==null){				
				req.setAttribute("MoneyByPnoServlet", "MoneyByPnoServlet");
			}else{
				req.setAttribute("MoneyByPnoServlet", "MoneyByPnoServlet");
				FeeDAO fa = new FeeDAO();
				Fee fee = fa.selectMoneyMenu(Integer.parseInt(pno));
				req.setAttribute("MoneyByOne", fee);
			}
			req.getRequestDispatcher("frame/feiyong.jsp").forward(req, resp);
			
	}

}
