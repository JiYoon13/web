package com.book;

public class DTO {
	int bnum, bprice, breadcnt, breproot, brepstep, brepindent;
	String bname, bauthor, bstory, bpublisher;
	public DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DTO(int bnum, int bprice, int breadcnt, int breproot, int brepstep, int brepindent, String bname,
			String bauthor, String bstory, String bpublisher) {
		super();
		this.bnum = bnum;
		this.bprice = bprice;
		this.breadcnt = breadcnt;
		this.breproot = breproot;
		this.brepstep = brepstep;
		this.brepindent = brepindent;
		this.bname = bname;
		this.bauthor = bauthor;
		this.bstory = bstory;
		this.bpublisher = bpublisher;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public int getBreadcnt() {
		return breadcnt;
	}
	public void setBreadcnt(int breadcnt) {
		this.breadcnt = breadcnt;
	}
	public int getBreproot() {
		return breproot;
	}
	public void setBreproot(int breproot) {
		this.breproot = breproot;
	}
	public int getBrepstep() {
		return brepstep;
	}
	public void setBrepstep(int brepstep) {
		this.brepstep = brepstep;
	}
	public int getBrepindent() {
		return brepindent;
	}
	public void setBrepindent(int brepindent) {
		this.brepindent = brepindent;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBstory() {
		return bstory;
	}
	public void setBstory(String bstory) {
		this.bstory = bstory;
	}
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	
	
}
