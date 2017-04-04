package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.BingLi;
import crt.bean.Patient;
import crt.dao.BingAnShiDAO;
import crt.dao.FeeDAO;
import crt.dao.HuShiDAO;

public class SelectFeeAndDescServlet extends HttpServlet {

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
		BingLi bl = new BingAnShiDAO().selectFeeAllAndDesc(Integer.parseInt(pno));
		req.setAttribute("oneBingLi", bl);
		req.getRequestDispatcher("frame/bingAnShi.jsp").forward(req, resp);
		
	}

	
	
}
