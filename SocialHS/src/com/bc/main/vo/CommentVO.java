package com.bc.main.vo;

public class CommentVO {
	private String bbc_idx, id, content, pw, regdate,
				bb_idx, chk, title;

	@Override
	public String toString() {
		return "CommentVO [bbc_idx=" + bbc_idx + ", id=" + id + ", content=" + content + ", pw=" + pw + ", regdate="
				+ regdate + ", bb_idx=" + bb_idx + ", chk=" + chk + ", title=" + title + "]";
	}
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getBbc_idx() {
		return bbc_idx;
	}

	public void setBbc_idx(String bbc_idx) {
		this.bbc_idx = bbc_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}
}
