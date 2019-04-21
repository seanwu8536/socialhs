package com.bc.main.vo;

public class PopUpVO {
	private String id, name, phone, email, regdate, bb_idx;

	@Override
	public String toString() {
		return "PopUpVO [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", regdate=" + regdate
				+ ", bb_idx=" + bb_idx + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getBb_idx() {
		return bb_idx;
	}

	public void setBb_idx(String bb_idx) {
		this.bb_idx = bb_idx;
	} 
}
