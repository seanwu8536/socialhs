package com.bc.main.vo;

public class LocationVO {
	private String L_Idx, L_Name;

	public LocationVO() {
		super();
	}

	@Override
	public String toString() {
		return "LocationVO [L_Idx=" + L_Idx + " , L_Name=" + L_Name + "]";
	}

	public String getL_Idx() {
		return L_Idx;
	}

	public void setL_Idx(String l_Idx) {
		L_Idx = l_Idx;
	}

	public String getL_Name() {
		return L_Name;
	}

	public void setL_Name(String l_Name) {
		L_Name = l_Name;
	} 
}

