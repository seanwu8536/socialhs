package com.bc.admin;

public class A_AllBoardVO {
	private int bb_idx, req_member, cur_member;
	private String id, title, content, regdate, bbs_name, hs, rp;
	
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
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
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	
	public String getHs() {
		return hs;
	}
	public void setHs(String hs) {
		this.hs = hs;
	}
	
	public int getReq_member() {
		return req_member;
	}
	public void setReq_member(int req_member) {
		this.req_member = req_member;
	}
	public int getCur_member() {
		return cur_member;
	}
	public void setCur_member(int cur_member) {
		this.cur_member = cur_member;
	}
	public String getRp() {
		return rp;
	}
	public void setRp(String rp) {
		this.rp = rp;
	}
	
	@Override
	public String toString() {
		return "A_AllBoardVO [bb_idx=" + bb_idx + ", req_member=" + req_member + ", cur_member=" + cur_member + ", id="
				+ id + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", bbs_name=" + bbs_name
				+ ", hs=" + hs + ", rp=" + rp + "]";
	}
	
	
}
