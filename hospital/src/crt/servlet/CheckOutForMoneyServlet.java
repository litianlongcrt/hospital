package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.FeeDAO;
import crt.dao.HuShiDAO;

public class CheckOutForMoneyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String pno = req.getParameter("pno");
		String money = req.getParameter("money");
		if(!"0.00".equals(money)){
			req.setAttribute("CheckOutForMoneyServlet", "出院成功!");
			FeeDAO fa = new FeeDAO();
			fa.addMoneyByPno(Integer.parseInt(pno), -Double.parseDouble(money));		
			
		}else{
			req.setAttribute("CheckOutForMoneyServlet", "费用已经结算过，不能重复结算！");
		}
		req.getRequestDispatcher("frame/feiyong.jsp").forward(req, resp);
		
	}

	
	
}
