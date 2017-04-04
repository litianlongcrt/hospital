package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.dao.DrugDAO;
import crt.util.Split;

public class SendDrugsServlet extends HttpServlet {

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
		//解析字符串
		String mdids = new String(req.getParameter("mdids").getBytes("iso-8859-1"),"utf-8");
		Split sp = new Split();
		//操作DAO
		List<Integer> ids = sp.slpitIntArray(mdids);
		
		DrugDAO dd = new DrugDAO();
		dd.sendDrugsByMDIds(ids);		
		req.getRequestDispatcher("TodayAllDrug").forward(req, resp);
	}

}
