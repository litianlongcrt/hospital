package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.MakeDrug;
import crt.dao.DrugDAO;

public class TodayAllDrugServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");		
		DrugDAO dd = new DrugDAO();
		List<MakeDrug> mds = dd.selectMakeDrugNoSend();
		req.getSession().setAttribute("TodayAllDrug", mds);
		req.getRequestDispatcher("frame/yaofang.jsp").forward(req, resp);
	}

}
