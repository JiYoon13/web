package com.yoon.myapp;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/index")
	public String tiles() {
		return "index";
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ScoreService scoreService = sqlSession.getMapper(ScoreService.class);
		ArrayList<ScoreDTO> list = scoreService.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/input")
	public ModelAndView input() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/inputdata")
	public String inputdata(HttpServletRequest request) {
		ScoreService scoreService = sqlSession.getMapper(ScoreService.class);
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int tec = Integer.parseInt(request.getParameter("tec"));
		int tot = kor + eng + mat + tec;
		double avg = (double)tot/4;
		String grade;
		switch(tot/4/10) {
		case 10:
		case 9: grade="A"; break;
		case 8: grade="B"; break;
		case 7: grade="C"; break;
		case 6: grade="D"; break;
		default: grade="F";
		}
	
		scoreService.input(no, name, kor, eng, mat, tec, tot, avg, grade);
		return "index";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST, value="/deletedata")
	public String deletedata(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		ScoreService scoreService = sqlSession.getMapper(ScoreService.class);
		scoreService.delete(no);
		return "index";
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST, value="/modifylist")
	public ModelAndView modifylist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String name = request.getParameter("name");
		ScoreService scoreService = sqlSession.getMapper(ScoreService.class);
		ArrayList<ScoreDTO> list = scoreService.modifylist(name);
		mv.setViewName("modifyform");
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping("/modifyform")
	public ModelAndView modifyform() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}@RequestMapping(method=RequestMethod.POST, value="/modifydata")
	public String modifydata(HttpServletRequest request) {
		ScoreService scoreService = sqlSession.getMapper(ScoreService.class);
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int tec = Integer.parseInt(request.getParameter("tec"));
		int tot = kor + eng + mat + tec;
		double avg = (double)tot/4;
		String grade;
		switch(tot/4/10) {
		case 10:
		case 9: grade="A"; break;
		case 8: grade="B"; break;
		case 7: grade="C"; break;
		case 6: grade="D"; break;
		default: grade="F";
		}
	
		scoreService.modify(no, name, kor, eng, mat, tec, tot, avg, grade);
		return "index";
	}
}
