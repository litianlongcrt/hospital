package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.dao.BedDAO;

public class PatientOutServlet extends HttpServlet {

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
		String pno = req.getParameter("pno");
		BedDAO bd = new BedDAO();
		int flag = 0;
		flag = bd.updatePatientOutByPno(Integer.parseInt(pno));			
		if(flag!=0){			
				req.setAttribute("PatientOut", "出院");	
				req.getRequestDispatcher("frame/hushi.jsp").forward(req, resp);	
		}else{
			req.getRequestDispatcher("frame/hushi.jsp").forward(req, resp);	
		}
		
	}

}
