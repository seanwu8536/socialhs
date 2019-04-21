package com.bc.main.vo;

public class SubLocationVO {
	private String sl_idx, sl_name, l_idx;

	public String getSl_idx() {
		return sl_idx;
	}

	public void setSl_idx(String sl_idx) {
		this.sl_idx = sl_idx;
	}

	public SubLocationVO() {
		super();
	}

	public SubLocationVO(String sl_idx, String sl_name, String l_idx) {
		super();
		this.sl_idx = sl_idx;
		this.sl_name = sl_name;
		this.l_idx = l_idx;
	}

	@Override
	public String toString() {
		return "SubLocationVO [sl_idx=" + sl_idx + ", sl_name=" + sl_name + ", l_idx=" + l_idx + "]";
	}

	public String getSl_name() {
		return sl_name;
	}

	public void setSl_name(String sl_name) {
		this.sl_name = sl_name;
	}

	public String getL_idx() {
		return l_idx;
	}

	public void setL_idx(String l_idx) {
		this.l_idx = l_idx;
	}
}
