package com.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DAO {
	
	public DAO() {}

	public void input(DTO dto) throws SQLException {
		String no = dto.getNo();
		String name = dto.getName();
		int kor = dto.getKor();
		int eng = dto.getEng();
		int mat = dto.getMat();
		int tec = dto.getTec();
		int tot = dto.getTot();
		double avg = dto.getAvg();
		
		Connection con;
		PreparedStatement psmt;
		try {
			String driver="oracle.jdbc.driver.OracleDriver";
			String url="jdbc:oracle:thin:@localhost:1521:xe";
		
			Class.forName(driver);
			con = DriverManager.getConnection(url, "ez311", "12345");
			
			String sql = "insert into score values(?,?,?,?,?,?,?,?)";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.setString(2, name);
			psmt.setInt(3, kor);
			psmt.setInt(4, eng);
			psmt.setInt(5, mat);
			psmt.setInt(6, tec);
			psmt.setInt(7, tot);
			psmt.setDouble(8, avg);
			
			psmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block	
			e.printStackTrace();
		}
		
		

	}
}
