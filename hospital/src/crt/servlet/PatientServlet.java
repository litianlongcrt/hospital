package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.MakeDrug;
import crt.bean.Patient;
import crt.bean.Staff;
import crt.dao.DoctorDAO;
import crt.dao.PatientDAO;

public class PatientServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1、编码
		req.setCharacterEncoding("utf-8");
		//2、请求
		String pno = req.getParameter("pno");
		PatientDAO pd = new PatientDAO();
		Patient patient = pd.selectByPno(Integer.parseInt(pno));
		req.getSession().setAttribute("patient", patient);
		Staff staff = (Staff)req.getSession().getAttribute("staff");
		//护士管理页面
		if(staff.getGrade().contains("D")){
			String date = req.getParameter("date");
			DoctorDAO dd = new DoctorDAO();
			List<MakeDrug> mds = dd.selectMakeDrugByPnoAndDate(Integer.parseInt(pno), date);
			req.getSession().setAttribute("SelectMakeDrugByPnoAndDate", mds);
			req.getRequestDispatcher("frame/huShiUpdatePatient.jsp").forward(req, resp);
		}
		//医生管理页面
		if(staff.getGrade().equals("C")){
			req.getRequestDispatcher("frame/patient.jsp").forward(req, resp);
		}
		
	}

}
