package com.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = new DAO();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		dao.Delete(bnum);
	}
}
