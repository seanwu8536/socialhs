package com.bc.main.vo;

public class BbsCodeVO {
	
	private int bbs_idx, bbs_type;
	private String bbs_name;
	
	
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public int getBbs_type() {
		return bbs_type;
	}
	public void setBbs_type(int bbs_type) {
		this.bbs_type = bbs_type;
	}
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	@Override
	public String toString() {
		return "BbsCodeVO [bbs_idx=" + bbs_idx + ", bbs_type=" + bbs_type + ", bbs_name=" + bbs_name + "]";
	}
	
	
	
}
