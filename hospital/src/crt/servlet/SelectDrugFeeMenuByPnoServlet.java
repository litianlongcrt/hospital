package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.DetailFee;
import crt.bean.Fee;
import crt.dao.FeeDAO;

public class SelectDrugFeeMenuByPnoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			String pno = req.getParameter("pno");
			if("".equals(pno)||pno==null){				
				req.setAttribute("SelectMakeDrugMenu", "SelectMakeDrugMenu");
			}else{
				req.setAttribute("SelectMakeDrugMenu", "SelectMakeDrugMenu");				
				FeeDAO fa = new FeeDAO();
				DetailFee df = fa.SelectMakeDrugMenu(Integer.parseInt(pno));			
				req.setAttribute("detailFee", df);				
			}
			req.getRequestDispatcher("frame/hushiFee.jsp").forward(req, resp);
			
	}

}
