package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.MakeDrug;
import crt.bean.Patient;
import crt.dao.DoctorDAO;

public class SureAddDrugServlet extends HttpServlet {

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
		String dnos[] = req.getParameterValues("dno");
		String sno = req.getParameter("sno");
		String counts[] = req.getParameterValues("count");
		String dates[] = req.getParameterValues("date");
		
		//String dnames[] = req.getParameterValues("dname");
		if(dnos.length!=0){
			DoctorDAO dd = new DoctorDAO();
			for(int i=0;i<dnos.length;i++){
				if("".equals(dnos[i])){
					continue;
				}else{
					int dno = Integer.parseInt(dnos[i]);
					int count = Integer.parseInt(counts[i]);
					String useDrugDate = dates[i];
					MakeDrug md = new MakeDrug(Integer.parseInt(pno), dno, Integer.parseInt(sno), count, null, useDrugDate, null);
					dd.makeDrug(md);
				}
			}	
		}
		req.setAttribute("makeDrug", "今日药已开，还可以继续开药！");
		req.getRequestDispatcher("frame/addDrug.jsp").forward(req, resp);
		
		
		
	}

}
