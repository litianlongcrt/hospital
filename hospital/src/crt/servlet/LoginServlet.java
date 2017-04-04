package crt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crt.bean.Staff;
import crt.dao.StaffDAO;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1、解决乱码
		req.setCharacterEncoding("utf-8");
		//2、获得请求参数
		String son = req.getParameter("sno");
		String pwd = req.getParameter("pwd");
		Staff staff = null;
		if(son.matches("\\w+")){
			//封装成对象
			Staff staff1 = new Staff(Integer.parseInt(son),pwd);
			//3、处理请求（操作数据库）		
			StaffDAO sd = new StaffDAO();
			staff = sd.selectOne(staff1);
		}
		//4、返回页面
		if(staff!=null){
			req.getSession().setAttribute("staff",staff);
			req.getRequestDispatcher("jsp/login.jsp").forward(req, resp);//这种方式更好 地址栏不变 	
		}else{
			req.setAttribute("loginMsg", "用户名或密码不正确");
			req.getRequestDispatcher("jsp/index.jsp").forward(req, resp);//这种方式更好 地址栏不变 	

		}
		
		//resp.sendRedirect("jsp/login.jsp"); //地址栏改变
	}

}
