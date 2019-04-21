package com.bc.main.vo;

public class googleChartVO {
	private String l_name, l_idx, number;

	@Override
	public String toString() {
		return "googleChartVO [l_name=" + l_name + ", l_idx=" + l_idx + ", number=" + number + "]";
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getL_idx() {
		return l_idx;
	}

	public void setL_idx(String l_idx) {
		this.l_idx = l_idx;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
}
