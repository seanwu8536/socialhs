package com.bc.main.vo;

public class ApplyVO {
	private String a_idx, id, bb_idx;

	public String getA_idx() {
		return a_idx;
	}

	public void setA_idx(String a_idx) {
		this.a_idx = a_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ApplyVO [a_idx=" + a_idx + ", id=" + id + ", bb_idx=" + bb_idx + "]";
	}

	public String getBb_idx() {
		return bb_idx;
	}

	public void setBb_idx(String bb_idx) {
		this.bb_idx = bb_idx;
	}
	
}
