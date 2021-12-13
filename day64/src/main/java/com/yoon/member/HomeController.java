package com.yoon.member;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView();
		MemberService memberService = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = memberService.list();
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/input")
	public ModelAndView input() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST, value="/inputdata")
	public ModelAndView inputdata(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		MemberService memberService = sqlSession.getMapper(MemberService.class);
		memberService.inputdata(id, name, tel, address, email);
		mv.setViewName("redirect:list");
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	@RequestMapping(method=RequestMethod.POST, value="/deletedata")
	public ModelAndView deletedata(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		MemberService memberService = sqlSession.getMapper(MemberService.class);
		memberService.deletedata(id);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		MemberService memberService = sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = memberService.modifylist(id);
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("modifydata")
	public ModelAndView modifydata(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		MemberService memberService = sqlSession.getMapper(MemberService.class);
		memberService.modifydata(id, name, tel, address, email);
		mv.setViewName("redirect:list");
		return mv;
	}
}
@Controller
class FileUploadController  {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\Spring\\day64\\src\\main\\webapp\\image";
	@RequestMapping(value="/form")
	public String form() {
	    return "uploadform";
	  }
	
	@RequestMapping(value="/upload",method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			//System.out.println(name+", "+value);
			map.put(name,value);
		} 
		
		List fileList= fileProcess(multipartRequest);
		map.put("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("redirect:list");
		return mav;
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); //이후 파일 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return fileList;
	}
}

@Controller
class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\Spring\\day64\\src\\main\\webapp\\image";
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);
		
		int last=imageFileName.lastIndexOf(".");
		String fileName=imageFileName.substring(0,last);
		File thum = new File(CURR_IMAGE_REPO_PATH+"\\"+"thum"+"\\"+fileName+".png");
		if(file.exists()) {
			thum.getParentFile().mkdir();	
			Thumbnails.of(file).size(70, 70).outputFormat("png").toOutputStream(out);		
		}	
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);	
		out.close();
	}
}