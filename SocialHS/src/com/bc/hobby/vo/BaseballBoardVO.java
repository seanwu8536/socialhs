package com.bc.hobby.vo;

public class BaseballBoardVO {
	
	private int base_idx, h_idx, l_idx, req_member, hit, good, bad; 
	private String id, title, content, regdate, file_name, rp;
	public int getBase_idx() {
		return base_idx;
	}
	public void setBase_idx(int base_idx) {
		this.base_idx = base_idx;
	}
	public int getH_idx() {
		return h_idx;
	}
	public void setH_idx(int h_idx) {
		this.h_idx = h_idx;
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public int getReq_member() {
		return req_member;
	}
	public void setReq_member(int req_member) {
		this.req_member = req_member;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getRp() {
		return rp;
	}
	public void setRp(String rp) {
		this.rp = rp;
	}
	@Override
	public String toString() {
		return "BaseballBoardVO [base_idx=" + base_idx + ", h_idx=" + h_idx + ", l_idx=" + l_idx + ", req_member="
				+ req_member + ", hit=" + hit + ", good=" + good + ", bad=" + bad + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", file_name=" + file_name + ", rp=" + rp + "]";
	}
	
	
	
}
