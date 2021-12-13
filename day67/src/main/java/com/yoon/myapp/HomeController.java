package com.yoon.myapp;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/list")
	public String list(Model model){
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		ArrayList<BoardDTO> alist = dao.list();
		model.addAttribute("list", alist);
		return "list";
	}
	@RequestMapping("/input")
	public String input() {
		return "input";
	}
	@RequestMapping("/inputdata")
	public String inputdata(HttpServletRequest request) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		
		dao.inputdata(id, pw, name, tel, email, address, birth);
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "delete";
	}
	@RequestMapping(method=RequestMethod.POST, value="/deleteform")
	public String deleteform(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		ArrayList<BoardDTO> alist = dao.deletelist(id);
		model.addAttribute("list", alist);
		return "deleteform";
	}
	@RequestMapping(method=RequestMethod.POST, value="/deletedata")
	public String deletedata(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("d_id");
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		dao.deletedata(id);
		return "redirect:list";
	}
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model model) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		String id = request.getParameter("id");
		ArrayList<BoardDTO> alist = dao.modifylist(id);
		model.addAttribute("list", alist);
		return "modifyform";
	}
	@RequestMapping(method=RequestMethod.POST, value="modifydata")
	public String modifydata(HttpServletRequest request) {
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		
		dao.modifydata(id, pw, name, tel, email, address, birth);
		return "redirect:list";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/loginaction")
	public ModelAndView login(RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		BoardInterface dao = sqlSession.getMapper(BoardInterface.class);
		boardDTO = dao.login(id, pw);
		
		
		if(boardDTO != null) { // 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("member", boardDTO);
			session.setAttribute("isLogOn", true);
			mv.setViewName("redirect:main");
		}
		else {
			rAttr.addAttribute("result", "loginFailed");
			mv.setViewName("redirect:loginForm");
		}
		return mv;
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:main");
		return mv;
	}
	@RequestMapping(method=RequestMethod.GET, value="/*Form")
	private ModelAndView form(@RequestParam(value="result", required=false) String result, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName(viewName);
		return mv;
	}
	
}
