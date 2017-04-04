package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.MakeDrug;
import crt.dao.DoctorDAO;

public class SelectMakeDrugByPnoAndDateServlet extends HttpServlet {

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
		String useDrugDate = req.getParameter("date");
		DoctorDAO dd = new DoctorDAO();
		List<MakeDrug> mds = dd.selectMakeDrugByPnoAndDate(Integer.parseInt(pno), useDrugDate);
		req.setAttribute("SelectMakeDrugByPnoAndDate", mds);
		req.getRequestDispatcher("frame/addDrug.jsp").forward(req, resp);
		
	}

}
