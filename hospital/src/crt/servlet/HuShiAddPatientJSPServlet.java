package crt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.dao.HuShiDAO;

public class HuShiAddPatientJSPServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HuShiDAO hs = new HuShiDAO();
		List<Integer> bnos = hs.getAllEmptyBed();
		request.setAttribute("bnos", bnos);
		request.getRequestDispatcher("frame/huShiAddPatient.jsp").forward(request, response);
	}

}
