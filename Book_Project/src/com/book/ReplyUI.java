package com.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyUI implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		DAO dao = new DAO();
		DTO data = dao.ReplyUI(bnum);
		request.setAttribute("rdata", data);
	}
}
