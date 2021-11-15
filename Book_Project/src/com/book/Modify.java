package com.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Modify implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = new DAO();
		HttpSession hs = request.getSession();
		int bnum = (Integer)hs.getAttribute("bnum");
		dao.Modify(bnum, request);
	}
}
