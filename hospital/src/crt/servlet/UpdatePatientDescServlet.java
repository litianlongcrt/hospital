package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Patient;
import crt.dao.HuShiDAO;
import crt.dao.PatientDAO;

public class UpdatePatientDescServlet extends HttpServlet {

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
		String desc = req.getParameter("desc");
		String pno = req.getParameter("pno");
		Patient patient = new Patient();
		patient.setDesc(desc);
		patient.setPno(Integer.parseInt(pno));
		PatientDAO pd = new PatientDAO();
		int flag = pd.updateDesc(patient);
		if(flag!=0){
			req.setAttribute("updateDesc", "诊断证明上传成功!");
		}else{
			req.setAttribute("updateDesc", "诊断证明上传失败!");
		}		
		req.getRequestDispatcher("frame/patient.jsp").forward(req, resp);		
	}
	

}
