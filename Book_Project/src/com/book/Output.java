package com.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Output implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = new DAO();
		ArrayList<DTO> alist = new ArrayList<DTO>();
		alist = dao.Output();
		request.setAttribute("alist", alist);
	}
}
