package com.bc.study.vo;

public class AttendanceBoardVO {

	//변수선언
	private int atte_idx, s_idx, l_idx, req_member, hit; 
	private String id, title, content, regdate, file_name, rp;
	
	//set,get
	public int getAtte_idx() {
		return atte_idx;
	}
	public void setAtte_idx(int atte_idx) {
		this.atte_idx = atte_idx;
	}
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
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
		return "AttendanceBoardVO [atte_idx=" + atte_idx + ", s_idx=" + s_idx + ", l_idx=" + l_idx + ", req_member="
				+ req_member + ", hit=" + hit + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", file_name=" + file_name + ", rp=" + rp + "]";
	}
	

	
	
}
