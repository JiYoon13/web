package com.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int index=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String uri=request.getRequestURI();
		String conpath=request.getContextPath();
		String fname=uri.substring(conpath.length());
		
		Connection con=null;
		PreparedStatement psmt;
		ResultSet res;
		
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ez311", "12345");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(fname.equals("/Insert.do")) {
			String bno = request.getParameter("bno");
			String bname = request.getParameter("bname");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			int price = Integer.parseInt(request.getParameter("price"));
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String sql="insert into bookstore values(?,?,?,?,?,?)";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, bno);
				psmt.setString(2, bname);
				psmt.setString(3, author);
				psmt.setString(4, publisher);
				psmt.setInt(5, price);
				psmt.setInt(6, cnt);
				
				int k = psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Admin_Output.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(fname.equals("/Delete.do")) {
			String d_bno = request.getParameter("d_bno");
			
			String sql="delete from bookstore where bno=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, d_bno);
				int k=psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Admin_Output.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		else if(fname.equals("/Modify.do")) {
			HttpSession hs = request.getSession();
			String bno = (String)hs.getAttribute("m_bno");
			String bname = (String)hs.getAttribute("m_bname");
			String author = request.getParameter("m_author");
			String publisher = request.getParameter("m_publisher");
			int price = Integer.parseInt(request.getParameter("m_price"));
			int cnt = Integer.parseInt(request.getParameter("m_cnt"));
			
			String sql="update bookstore set author=?, publisher=?, price=?, cnt=? where bno=? and bname=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, author);
				psmt.setString(2, publisher);
				psmt.setInt(3, price);
				psmt.setInt(4, cnt);
				psmt.setString(5, bno);
				psmt.setString(6, bname);
				int k=psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Admin_Output.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(fname.equals("/Login_i.do")) {
			index=1;
			response.sendRedirect("Login.jsp");
		}
		else if(fname.equals("/Login_m.do")) {
			index=2;
			response.sendRedirect("Login.jsp");
		}
		else if(fname.equals("/Success.do")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
					
				String sql="select * from login where id=? and pw=?";
				try {
					psmt=con.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, pw);
					res=psmt.executeQuery();
					if(res.next()) {
						if(index==1)
							response.sendRedirect("Insert.jsp");
						else if(index==2)
							response.sendRedirect("Admin_Output.jsp");
						}
					else{
						response.sendRedirect("Login.jsp");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		else if(fname.equals("/Buy.do")) {
			LocalDateTime now = LocalDateTime.now();
			String formatedNow = now.format(DateTimeFormatter.ofPattern("yy-MM-dd HH:mm:ss"));
			HttpSession hs = request.getSession();
			String bno = (String)hs.getAttribute("bno");
			String bdate = formatedNow;
			String bname = (String)hs.getAttribute("bname");
			int price = (Integer)hs.getAttribute("price");
			int b_cnt = Integer.parseInt(request.getParameter("b_cnt"));
			int tot = price * b_cnt;
			int cnt = (Integer)hs.getAttribute("cnt");
			int tcnt = cnt - b_cnt;
			
			String sql="update bookstore set cnt=? where bno=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setInt(1, tcnt);
				psmt.setString(2, bno);
				psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String sql2="insert into booklist values(?,?,?,?,?)";
			try {
				psmt=con.prepareStatement(sql2);
				psmt.setString(1, bdate);
				psmt.setString(2, bname);
				psmt.setInt(3, price);
				psmt.setInt(4, b_cnt);
				psmt.setInt(5, tot);
				int k=psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("BuyList.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
