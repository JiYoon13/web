package com.yoon.myapp;

import java.util.ArrayList;

public interface BoardInterface {
	public void inputdata(String id, String pw, String name, String tel, String email, String address, String birth);
	public void deletedata(String id);
	public void modifydata(String id, String pw, String name, String tel, String email, String address, String birth);
	public ArrayList<BoardDTO> list();
	public ArrayList<BoardDTO> deletelist(String id);
	public ArrayList<BoardDTO> modifylist(String id);
	public BoardDTO login(String id, String pw);
	
	public void board_inputdata(String writer, String title, String content);
	public void board_deletedata(int num);
	public void readcnt(int num);
	public void makereply(int groups, int step);
	public void board_replyinput(int num, String r_writer, String r_title, String r_content, int groups, int step, int indent);
	public ArrayList<TBoardDTO> board_list();
	public ArrayList<TBoardDTO> board_detail(int num);
	public ArrayList<TBoardDTO> replyform(int num);
	
}
