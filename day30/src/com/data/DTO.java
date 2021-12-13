package com.data;

public class DTO {
	String no, name;
	int kor, eng, mat, tec;
	int tot;
	double avg;
	public DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DTO(String no, String name, int kor, int eng, int mat, int tec) {
		super();
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.tec = tec;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getTec() {
		return tec;
	}
	public void setTec(int tec) {
		this.tec = tec;
	}
	public int getTot() {
		tot = this.getKor() + this.getEng() + this.getMat() + this.getTec();
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		avg = (double)this.getTot()/4;
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
}
