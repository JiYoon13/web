package com.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Reply implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String bname = request.getParameter("bname");
		String r_bauthor = request.getParameter("r_bauthor"); // ÀÛ¼ºÀÚ
		String r_bstory = request.getParameter("r_bstory").replace("\r\n", "<br>"); // ¸®ºä
		String bpublisher = request.getParameter("bpublisher");
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		int breproot = Integer.parseInt(request.getParameter("breproot"));
		int brepstep = Integer.parseInt(request.getParameter("brepstep"));
		int brepindent = Integer.parseInt(request.getParameter("brepindent"));
		
		DAO dao = new DAO();
		dao.Reply(bnum, bname, r_bauthor, r_bstory, bpublisher, bprice, breproot, brepstep, brepindent);
	}
}
