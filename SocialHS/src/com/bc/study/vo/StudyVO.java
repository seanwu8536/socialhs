package com.bc.study.vo;

public class StudyVO {
	private int S_IDX;
	private String S_NAME;
	
	public int getS_IDX() {
		return S_IDX;
	}
	public void setS_IDX(int s_IDX) {
		S_IDX = s_IDX;
	}
	public String getS_NAME() {
		return S_NAME;
	}
	public void setS_NAME(String s_NAME) {
		S_NAME = s_NAME;
	}
	
	@Override
	public String toString() {
		return "StudyVO [S_IDX=" + S_IDX + ", S_NAME=" + S_NAME + "]";
	}
	
	
	
}
