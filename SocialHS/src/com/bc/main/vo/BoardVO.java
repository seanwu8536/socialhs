package com.bc.main.vo;

public class BoardVO {
	
	private int bb_idx, hit, req_member, cur_member, chk, l_idx, bbs_idx, good, bad, latitude, longitude, sl_idx;
	private String id, title, content, file_name, regdate, rp, hs, time, place;
	
	
	
	
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
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
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public int getSl_idx() {
		return sl_idx;
	}
	public void setSl_idx(int sl_idx) {
		this.sl_idx = sl_idx;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRp() {
		return rp;
	}
	public void setRp(String rp) {
		this.rp = rp;
	}
	public String getHs() {
		return hs;
	}
	public void setHs(String hs) {
		this.hs = hs;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bb_idx=" + bb_idx + ", hit=" + hit + ", req_member=" + req_member + ", cur_member="
				+ cur_member + ", chk=" + chk + ", l_idx=" + l_idx + ", bbs_idx=" + bbs_idx + ", good=" + good
				+ ", bad=" + bad + ", latitude=" + latitude + ", longitude=" + longitude + ", sl_idx=" + sl_idx
				+ ", id=" + id + ", title=" + title + ", content=" + content + ", file_name=" + file_name + ", regdate="
				+ regdate + ", rp=" + rp + ", hs=" + hs + ", time=" + time + ", place=" + place + "]";
	}
	
	
	
}
