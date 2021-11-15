package com.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charse=utf-8");
		
		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String fname = uri.substring(conpath.length());
		
		BCommand command;
		String viewPage=null;
		
		if(fname.equals("/Input.do")) {
			command = new Input();
			command.execute(request, response);
			viewPage="Main.jsp";
		}
		/*
		else if(fname.equals("/Output.do")) {
			command = new Output();
			command.execute(request, response);
			viewPage="BookOutput.jsp";
		}
		*/
		else if(fname.equals("/Output.do")) {
			command = new Page();
			command.execute(request, response);
			viewPage="PageOut.jsp";
		}
		else if(fname.equals("/Modify.do")) {
			command = new Modify();
			command.execute(request, response);
			viewPage="Output.do";
		}
		else if(fname.equals("/Delete.do")) {
			command = new Delete();
			command.execute(request, response);
			viewPage="Output.do";
		}
		else if(fname.equals("/Retrieve.do")) {
			command = new Retrieve();
			command.execute(request, response);
			viewPage="BookRetrieve.jsp";
		}
		else if(fname.equals("/ReplyUI.do")) {
			command = new ReplyUI();
			command.execute(request, response);
			viewPage="BookReplyUI.jsp";
		}
		else if(fname.equals("/Reply.do")) {
			command = new Reply();
			command.execute(request, response);
			viewPage="Output.do";
		}
		else if(fname.equals("/Review.do")) {
			command = new Review();
			command.execute(request, response);
			viewPage="BookReview.jsp";
		}
		else if(fname.equals("/Search.do")) {
			command = new Search();
			command.execute(request, response);
			viewPage="PageOut.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
