package com.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class DAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet res;
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";

	public DAO() {
		super();
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url, "ez311", "12345");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void Input(HttpServletRequest request) {
		String bname = request.getParameter("bname");
		String bauthor = request.getParameter("bauthor");
		String bstory = request.getParameter("bstory").replace("\r\n", "<br>");
		String bpublisher = request.getParameter("bpublisher");
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		
		String sql="INSERT INTO BOOK VALUES(BOOK_SEQ.nextval,?,?,?,?,?,0,BOOK_SEQ.currval,0,0)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, bname);
			psmt.setString(2, bauthor);
			psmt.setString(3, bstory);
			psmt.setString(4, bpublisher);
			psmt.setInt(5, bprice);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// input-end
	
	public ArrayList<DTO> Output() {
		ArrayList<DTO> alist = new ArrayList<DTO>();
		String sql="SELECT * FROM BOOK ORDER BY BREPROOT DESC, BREPSTEP ASC";
		try {
			psmt=con.prepareStatement(sql);
			res=psmt.executeQuery();
			
			while(res.next()) {
				int bnum = res.getInt("bnum");
				String bname = res.getString("bname");
				String bauthor = res.getString("bauthor");
				String bstory = res.getString("bstory");
				String bpublisher = res.getString("bpublisher");
				int bprice = res.getInt("bprice");
				int breadcnt = res.getInt("breadcnt");
				int breproot = res.getInt("breproot");
				int brepstep = res.getInt("brepstep");
				int brepindent = res.getInt("brepindent");
				
				DTO dto = new DTO(bnum, bprice, breadcnt, breproot, brepstep, brepindent, bname, bauthor, bstory, bpublisher);
				alist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}// output-end
	
	public void Modify(int bnum, HttpServletRequest request) {
		String bname = request.getParameter("m_bname");
		String bauthor = request.getParameter("m_bauthor");
		String bstory = request.getParameter("m_bstory").replace("\r\n", "<br>");
		String bpublisher = request.getParameter("m_bpublisher");
		int bprice = Integer.parseInt(request.getParameter("m_bprice"));

		String sql="UPDATE BOOK SET bname=?, bauthor=?, bstory=?, bpublisher=?, bprice=?, breadcnt=0 WHERE bnum=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, bname);
			psmt.setString(2, bauthor);
			psmt.setString(3, bstory);
			psmt.setString(4, bpublisher);
			psmt.setInt(5, bprice);
			psmt.setInt(6, bnum);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// modify-end
	
	public void Delete(int bnum) {
		String sql="DELETE FROM BOOK WHERE BNUM=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, bnum);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// delete-end
	
	public DTO Retrieve(int bnum) {
		Readcnt(bnum);
		String sql="SELECT * FROM BOOK WHERE BNUM=?";
		DTO dto = new DTO();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, bnum);
			res=psmt.executeQuery();
			if(res.next()) {
				String bname = res.getString("bname");
				String bauthor = res.getString("bauthor");
				String bstory = res.getString("bstory");
				String bpublisher = res.getString("bpublisher");
				int bprice = res.getInt("bprice");
				int breadcnt = res.getInt("breadcnt");
				
				dto.setBnum(bnum);
				dto.setBname(bname);
				dto.setBauthor(bauthor);
				dto.setBstory(bstory);
				dto.setBpublisher(bpublisher);
				dto.setBprice(bprice);
				dto.setBreadcnt(breadcnt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}// retrieve-end
	
	public DTO Review(int bnum) {
		Readcnt(bnum);
		String sql="SELECT * FROM BOOK WHERE BNUM=?";
		DTO dto = new DTO();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, bnum);
			res=psmt.executeQuery();
			if(res.next()) {
				String bname = res.getString("bname");
				String bauthor = res.getString("bauthor"); //府轰累己磊
				String bstory = res.getString("bstory"); // 府轰
				String bpublisher = res.getString("bpublisher");
				int bprice = res.getInt("bprice");
				int breadcnt = res.getInt("breadcnt");
				
				dto.setBnum(bnum);
				dto.setBname(bname);
				dto.setBauthor(bauthor);
				dto.setBstory(bstory);
				dto.setBpublisher(bpublisher);
				dto.setBprice(bprice);
				dto.setBreadcnt(breadcnt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void Readcnt(int bnum) {
		String sql="UPDATE BOOK SET BREADCNT=BREADCNT+1 WHERE BNUM=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, bnum);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public DTO ReplyUI(int bnum) {
		DTO dto = new DTO();
		String sql="SELECT * FROM BOOK WHERE BNUM=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, bnum);
			res=psmt.executeQuery();
			
			if(res.next()) {
			dto.setBnum(res.getInt("bnum"));
			dto.setBname(res.getString("bname"));
			dto.setBauthor(res.getString("bauthor"));
			dto.setBstory(res.getString("bstory"));
			dto.setBpublisher(res.getString("bpublisher"));
			dto.setBprice(res.getInt("bprice"));
			dto.setBreadcnt(res.getInt("breadcnt"));
			dto.setBreproot(res.getInt("breproot"));
			dto.setBrepstep(res.getInt("brepstep"));
			dto.setBrepindent(res.getInt("brepindent"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}// ReplyUI-end
	
	public void Reply(int bnum, String bname, String r_bauthor, String r_bstory, String bpublisher, int bprice, int breproot, int brepstep, int brepindent) {
		MakeReply(breproot, brepstep);
		String sql="INSERT INTO BOOK(BNUM, BNAME, BAUTHOR, BSTORY, BPUBLISHER, BPRICE, BREPROOT, BREPSTEP, BREPINDENT) VALUES(BOOK_SEQ.nextval, ?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, bname);
			psmt.setString(2, r_bauthor);
			psmt.setString(3, r_bstory); // 府轰
			psmt.setString(4, bpublisher);
			psmt.setInt(5, bprice);
			psmt.setInt(6, breproot);
			psmt.setInt(7, brepstep+1);
			psmt.setInt(8, brepindent+1);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// Reply-end
	
	public void MakeReply(int breproot, int brepstep) {
		String sql="UPDATE BOOK SET BREPSTEP = BREPSTEP + 1 WHERE BREPROOT=? AND BREPSTEP > ?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, breproot);
			psmt.setInt(2, brepstep);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// MakeReply-end
	
	public ArrayList<DTO> Search(String sname, String svalue) {
		String sql="SELECT BNUM, BNAME, BAUTHOR, BPUBLISHER, BPRICE, BREADCNT, BREPINDENT FROM BOOK WHERE ";
		ArrayList<DTO> alist = new ArrayList<DTO>();
		if(sname.equals("bname")) 
			sql += "BNAME LIKE ? ";
		else if(sname.equals("bauthor"))
			sql += "BAUTHOR LIKE ? ";
		else
			sql += "BPUBLISHER LIKE ?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, "%" + svalue + "%");
			res=psmt.executeQuery();
			
			while(res.next()) {
				int bnum = res.getInt("bnum");
				String bname = res.getString("bname");
				String bauthor = res.getString("bauthor");
				String bpublisher = res.getString("bpublisher");
				int bprice = res.getInt("bprice");
				int breadcnt = res.getInt("breadcnt");
				int brepindent = res.getInt("brepindent");
				
				DTO dto = new DTO();
				dto.setBnum(bnum);
				dto.setBname(bname);
				dto.setBauthor(bauthor);
				dto.setBpublisher(bpublisher);
				dto.setBprice(bprice);
				dto.setBreadcnt(breadcnt);
				dto.setBrepindent(brepindent);
				
				alist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}// search-end
	
	public PageDTO Page(int curpage) {
		PageDTO pdto = new PageDTO();
		int perpage = pdto.getPerpage();
		int skip = (curpage-1) * perpage;
		int totalcnt = totalcnt();
		ArrayList<DTO> alist = new ArrayList<DTO>();
		
		String sql="SELECT * FROM BOOK ORDER BY BREPROOT DESC, BREPSTEP ASC";
		try {
			psmt=con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			res=psmt.executeQuery();
			if(skip > 0)
				res.absolute(skip);
			for(int i=0; i<perpage && res.next(); i++) {
				int bnum = res.getInt("bnum");
				String bname = res.getString("bname");
				String bauthor = res.getString("bauthor");
				String bstory = res.getString("bstory");
				String bpublisher = res.getString("bpublisher");
				int bprice = res.getInt("bprice");
				int breadcnt = res.getInt("breadcnt");
				int breproot = res.getInt("breproot");
				int brepstep = res.getInt("brepstep");
				int brepindent = res.getInt("brepindent");
				
				DTO dto = new DTO();
				dto.setBnum(bnum);
				dto.setBname(bname);
				dto.setBauthor(bauthor);
				dto.setBstory(bstory);
				dto.setBpublisher(bpublisher);
				dto.setBprice(bprice);
				dto.setBreadcnt(breadcnt);
				dto.setBreproot(breproot);
				dto.setBrepstep(brepstep);
				dto.setBrepindent(brepindent);
				
				alist.add(dto);
			}
			pdto.setAlist(alist);
			pdto.setCurpage(curpage);
			pdto.setTotalcnt(totalcnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pdto;
	}// page-end
	
	public int totalcnt() {
		String sql="SELECT COUNT(*) FROM BOOK";
		int totalcnt = 0;
		try {
			psmt=con.prepareStatement(sql);
			res=psmt.executeQuery();
			if(res.next())
				totalcnt = res.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalcnt;
	}// totalcnt-end
}
