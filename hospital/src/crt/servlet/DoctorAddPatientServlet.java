package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.DoctorDAO;
import crt.dao.PatientDAO;

public class DoctorAddPatientServlet extends HttpServlet {

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
		String sno = req.getParameter("sno");
		String pno = req.getParameter("pno");
		req.setAttribute("DoctorAddPatientShowDiv", "DoctorAddPatientShowDiv");
		if(!"".equals(pno)){
			DoctorDAO dd = new DoctorDAO();
			int count = dd.selectPatientCountByPno(Integer.parseInt(pno));
			if(count==0){
				req.setAttribute("msg", "添加错误，没有该病人！");				
			}else if(count==1){
				dd.addPatientByPno(Integer.parseInt(sno), Integer.parseInt(pno));
				req.setAttribute("msg", "患者添加成功");
			}else{
				req.setAttribute("msg", "该病人已经有主治医生，不能重复添加！");
			}
			
		}
		req.getRequestDispatcher("frame/patients.jsp").forward(req, resp);
		
		
	}

}
