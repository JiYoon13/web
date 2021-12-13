package com.yoon.myapp;

import java.util.ArrayList;

public interface ScoreService {
	public ArrayList<ScoreDTO> list();
	public void input(int no, String name, int kor, int eng, int mat, int tec, int tot, double avg, String grade);
	public void delete(int no);
	public ArrayList<ScoreDTO> modifylist(String name);
	public void modify(int no, String name, int kor, int eng, int mat, int tec, int tot, double avg, String grade);
}
