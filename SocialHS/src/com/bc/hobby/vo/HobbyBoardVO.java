package com.bc.hobby.vo;

public class HobbyBoardVO {
	private String bb_idx, id, title, content, file_name,
				regdate, hit, req_member, cur_member, rp,
				chk, l_idx, bbs_idx, hs, good,
				bad, latitude, longitude, time, place, sl_idx;
	
	private String bbs_name;

	public String getBbs_name() {
		return bbs_name;
	}

	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}

	public String getBb_idx() {
		return bb_idx;
	}

	public void setBb_idx(String bb_idx) {
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

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getReq_member() {
		return req_member;
	}

	public void setReq_member(String req_member) {
		this.req_member = req_member;
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

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	public String getL_idx() {
		return l_idx;
	}

	public void setL_idx(String l_idx) {
		this.l_idx = l_idx;
	}

	public String getBbs_idx() {
		return bbs_idx;
	}

	public void setBbs_idx(String bbs_idx) {
		this.bbs_idx = bbs_idx;
	}

	public String geths() {
		return hs;
	}

	public void seths(String hs) {
		this.hs = hs;
	}

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public String getBad() {
		return bad;
	}

	public void setBad(String bad) {
		this.bad = bad;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
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

	public String getSl_idx() {
		return sl_idx;
	}

	public void setSl_idx(String sl_idx) {
		this.sl_idx = sl_idx;
	}

	@Override
	public String toString() {
		return "HobbyBoardVO [bb_idx=" + bb_idx + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", file_name=" + file_name + ", regdate=" + regdate + ", hit=" + hit + ", req_member=" + req_member
				+ ", cur_member=" + cur_member + ", rp=" + rp + ", chk=" + chk + ", l_idx=" + l_idx + ", bbs_idx="
				+ bbs_idx + ", hs=" + hs + ", good=" + good + ", bad=" + bad + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", time=" + time + ", place=" + place + ", sl_idx=" + sl_idx
				+ ", bbs_name=" + bbs_name + "]";
	}

	
	
	
}
