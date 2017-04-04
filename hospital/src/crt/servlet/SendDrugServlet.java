package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.dao.DrugDAO;

public class SendDrugServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mdid = req.getParameter("mdid");
		DrugDAO dd = new DrugDAO();
		int flag = dd.sendDrugByMDId(Integer.parseInt(mdid));
		if(flag!=0){
			req.getRequestDispatcher("TodayAllDrug").forward(req, resp);
		}else{
			req.getRequestDispatcher("TodayAllDrug").forward(req, resp);	
		}
		
	}
	
}
