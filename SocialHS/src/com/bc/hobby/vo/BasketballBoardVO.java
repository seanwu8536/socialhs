package com.bc.hobby.vo;

public class BasketballBoardVO {
	private String bask_idx, id, title, content, h_idx, 
					l_idx, regdate, req_member, file_name, hit, 
					cur_member, rp;

	public BasketballBoardVO(String bask_idx, String id, String title, String content, String h_idx, String l_idx,
			String regdate, String req_member, String file_name, String hit, String cur_member, String rp) {
		super();
		this.bask_idx = bask_idx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.h_idx = h_idx;
		this.l_idx = l_idx;
		this.regdate = regdate;
		this.req_member = req_member;
		this.file_name = file_name;
		this.hit = hit;
		this.cur_member = cur_member;
		this.rp = rp;
	}

	@Override
	public String toString() {
		return "BasketballVO [bask_idx=" + bask_idx + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", h_idx=" + h_idx + ", l_idx=" + l_idx + ", regdate=" + regdate + ", req_member=" + req_member
				+ ", file_name=" + file_name + ", hit=" + hit + ", cur_member=" + cur_member + ", rp=" + rp + "]";
	}

	public BasketballBoardVO() {
		super();
	}

	public String getBask_idx() {
		return bask_idx;
	}

	public void setBask_idx(String bask_idx) {
		this.bask_idx = bask_idx;
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

	public String getH_idx() {
		return h_idx;
	}

	public void setH_idx(String h_idx) {
		this.h_idx = h_idx;
	}

	public String getL_idx() {
		return l_idx;
	}

	public void setL_idx(String l_idx) {
		this.l_idx = l_idx;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReq_member() {
		return req_member;
	}

	public void setReq_member(String req_member) {
		this.req_member = req_member;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getCur_member() {
		return cur_member;
	}

	public void setCur_member(String cur_member) {
		this.cur_member = cur_member;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}
}
