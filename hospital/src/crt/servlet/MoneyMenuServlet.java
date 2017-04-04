package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Fee;
import crt.dao.FeeDAO;

public class MoneyMenuServlet extends HttpServlet {

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
			FeeDAO fd = new FeeDAO();
			List<Fee> fees = fd.selectMoneyMenu();
			req.setAttribute("moneyMenu", fees);
			req.getRequestDispatcher("frame/feiyong.jsp").forward(req, resp);
			
	}

}
