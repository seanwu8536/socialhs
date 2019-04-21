package com.bc.hobby.vo;

public class PhotoBoardVO {
	private int phot_idx, h_idx, l_idx, req_member, hit, cur_member;
	private String id, title, content, regdate, file_name, rp;
	
	public int getPhot_idx() {
		return phot_idx;
	}
	public void setPhot_idx(int phot_idx) {
		this.phot_idx = phot_idx;
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
	public int getCur_member() {
		return cur_member;
	}
	public void setCur_member(int cur_member) {
		this.cur_member = cur_member;
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
		return "PhotoBoardVO [phot_idx=" + phot_idx + ", h_idx=" + h_idx + ", l_idx=" + l_idx + ", req_member="
				+ req_member + ", hit=" + hit + ", cur_member=" + cur_member + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", file_name=" + file_name + ", rp=" + rp + "]";
	}
	
}
