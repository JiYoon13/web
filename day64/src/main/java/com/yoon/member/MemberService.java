package com.yoon.member;

import java.util.ArrayList;

public interface MemberService {
	public ArrayList<MemberDTO> list();
	public void inputdata(String id, String name, String tel, String address, String email);
	public void deletedata(String id);
	public ArrayList<MemberDTO> modifylist(String id);
	public void modifydata(String id, String name, String tel, String address, String email);
}
