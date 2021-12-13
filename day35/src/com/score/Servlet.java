package com.score;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String fname = uri.substring(conpath.length());
		
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
			String name = request.getParameter("name");
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			int mat = Integer.parseInt(request.getParameter("mat"));
			int tot = doTot(kor, eng, mat);
			double avg = doAvg(tot);
			String grade = doGrade(tot);
			String sql = "insert into score30 values(?,?,?,?,?,?,?)";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setInt(2, kor);
				psmt.setInt(3, eng);
				psmt.setInt(4, mat);
				psmt.setInt(5, tot);
				psmt.setDouble(6, avg);
				psmt.setString(7, grade);
				int k = psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Select.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(fname.equals("/Update.do")) {
			HttpSession hs = request.getSession();
			String name = (String)hs.getAttribute("u_name");
			int kor = Integer.parseInt(request.getParameter("u_kor"));
			int eng = Integer.parseInt(request.getParameter("u_eng"));
			int mat = Integer.parseInt(request.getParameter("u_mat"));
			int tot = doTot(kor, eng, mat);
			double avg = doAvg(tot);
			String grade = doGrade(tot);
			String sql = "update score30 set kor=?, eng=?, mat=?, tot=?, avg=?, grade=? where name=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setInt(1, kor);
				psmt.setInt(2, eng);
				psmt.setInt(3, mat);
				psmt.setInt(4, tot);
				psmt.setDouble(5, avg);
				psmt.setString(6, grade);
				psmt.setString(7, name);
				
				int k = psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Select.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(fname.equals("/Delete.do")) {
			String name = request.getParameter("u_name");
			String sql = "delete from score30 where name=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, name);
				int k = psmt.executeUpdate();
				if(k==1)
					response.sendRedirect("Select.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected int doTot(int kor, int eng, int mat) {
		int tot = kor + eng + mat;
		return tot;
	}
	protected double doAvg(int tot) {
		double avg = (double)tot/3;
		return avg;
	}
	protected String doGrade(int tot) {
		String grade;
		switch((tot/3)/10) {
			case 10:
			case 9:
				grade="A"; break;
			case 8:
				grade="B"; break;
			case 7:
				grade="C"; break;
			case 6:
				grade="D"; break;
			default: 
				grade="F"; break;
		}
		return grade;
	}
}
