package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.DoctorDAO;
import crt.dao.PatientDAO;

public class DoctorAddPatientDivServlet extends HttpServlet {

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
		req.setAttribute("DoctorAddPatientShowDiv", "DoctorAddPatientShowDiv");
		req.getRequestDispatcher("frame/patients.jsp").forward(req, resp);
		
		
	}

}
