package com.book;

import java.util.ArrayList;

public class PageDTO {
	int curpage=1;
	int perpage=5;
	int totalcnt;
	ArrayList<DTO> plist;
	
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public int getPerpage() {
		return perpage;
	}
	public void setPerpage(int perpage) {
		this.perpage = perpage;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public ArrayList<DTO> getAlist() {
		return plist;
	}
	public void setAlist(ArrayList<DTO> plist) {
		this.plist = plist;
	}
}
