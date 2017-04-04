package crt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Fee;
import crt.dao.FeeDAO;

public class AddMoneyByPnoServlet extends HttpServlet {

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
			String pno = req.getParameter("addPno");
			String money = req.getParameter("money");
			if("".equals(pno)||pno==null||"".equals(money)||money==null){				
				req.setAttribute("SelectMoneyByPno", "SelectMoneyByPno");
			}else{
				req.setAttribute("SelectMoneyByPno", "SelectMoneyByPno");				
				FeeDAO fa = new FeeDAO();
				int flag = fa.addMoneyByPno(Integer.parseInt(pno), Double.parseDouble(money));
				if(flag != 0){
					req.setAttribute("AddMoneySuccess", "success");
				}
			}
			req.getRequestDispatcher("frame/feiyong.jsp").forward(req, resp);
			
	}

}
