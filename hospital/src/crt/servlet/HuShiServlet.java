package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.HuShiDAO;

public class HuShiServlet extends HttpServlet {

	/*@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HuShiDAO hs = new HuShiDAO();
		List<Patient> HSpatients = hs.byPnos(hs.getAllPno());
		req.setAttribute("HSpatients", HSpatients);	
		req.getRequestDispatcher("frame/hushi.jsp").forward(req, resp);
	}

	
	*/
}
