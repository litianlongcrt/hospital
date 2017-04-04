package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.dao.HuShiDAO;

public class EmptyBedServlet extends HttpServlet {

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
		HuShiDAO hs = new HuShiDAO();
		List<Integer> bnos = hs.getAllEmptyBed();
		req.setAttribute("bnos", bnos);
		req.getRequestDispatcher("frame/emptyBed.jsp").forward(req, resp);
	}

}
