package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.HuShiDAO;

public class AddPatientServlet extends HttpServlet {

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
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		String bing = req.getParameter("bing");
		String time = req.getParameter("time");
		String bed = req.getParameter("bno").replace(" ", "");
		String sno = req.getParameter("sno");
		Patient patient = new Patient(-1, name, sex, Integer.parseInt(age), address, tel, bing, time,Integer.parseInt(bed));		
		
		HuShiDAO hs = new HuShiDAO();
		int f = hs.addPatient(patient,Integer.parseInt(sno));
		if(f==1){
			req.setAttribute("addPatient", "成功");
		}
		req.getRequestDispatcher("frame/hushi.jsp").forward(req, resp);
		
	}
	

}
