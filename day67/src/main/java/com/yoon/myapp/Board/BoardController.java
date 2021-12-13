package com.yoon.myapp.Board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yoon.myapp.BoardInterface;
import com.yoon.myapp.TBoardDTO;

@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/board_input")
	public String board_input() {
		return "board_input";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/board_inputdata")
	public String board_inputdata(HttpServletRequest request) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content").replace("\r\n", "<br>");
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.board_inputdata(writer, title, content);
		return "main";
	}
	
	@RequestMapping("/board_list")
	public String board_list(Model model) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		ArrayList<TBoardDTO> alist = dao.board_list();
		model.addAttribute("list", alist);
		return "board_list";
	}
	
	@RequestMapping("/detail")
	public String board_detail(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		Readcnt(num);
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		ArrayList<TBoardDTO> alist = dao.board_detail(num);
		model.addAttribute("list", alist);
		return "board_detail";
	}
	
	public void Readcnt(int num) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.readcnt(num);
	}
	
	@RequestMapping("/board_delete")
	public String board_delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.board_deletedata(num);
		return "redirect:board_list";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/replyform")
	public String replyform(HttpServletRequest request, Model model) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		int num = Integer.parseInt(request.getParameter("num"));
		ArrayList<TBoardDTO> alist = dao.replyform(num);
		model.addAttribute("list", alist);
		return "replyform";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String r_writer = request.getParameter("r_writer");
		String r_title = request.getParameter("r_title");
		String r_content = request.getParameter("r_content").replace("\r\n", "<br>");
		MakeReply(groups, step);
		step ++;
		indent ++;
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.board_replyinput(num, r_writer, r_title, r_content, groups, step, indent);
		return "redirect:board_list";
	}
	
	public void MakeReply(int groups, int step){
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.makereply(groups, step);
	}
	 
}
