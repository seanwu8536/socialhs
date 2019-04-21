package com.bc.study.vo;

public class EnglishBoardVO {
	private int ENG_IDX, S_IDX, L_IDX, REQ_MEMBER, HIT, CUR_MEMBER;
	private String ID, TITLE, CONTENT, REGDATE, FILE_NAME, RP;
	
	
	public EnglishBoardVO() {
		super();
	}
	
	
	
	public EnglishBoardVO(int eNG_IDX, int s_IDX, int l_IDX, int rEQ_MEMBER, int hIT, int cUR_MEMBER, String iD,
			String tITLE, String cONTENT, String rEGDATE, String fILE_NAME, String rP) {
		super();
		ENG_IDX = eNG_IDX;
		S_IDX = s_IDX;
		L_IDX = l_IDX;
		REQ_MEMBER = rEQ_MEMBER;
		HIT = hIT;
		CUR_MEMBER = cUR_MEMBER;
		ID = iD;
		TITLE = tITLE;
		CONTENT = cONTENT;
		REGDATE = rEGDATE;
		FILE_NAME = fILE_NAME;
		RP = rP;
	}



	public int getENG_IDX() {
		return ENG_IDX;
	}
	public void setENG_IDX(int eNG_IDX) {
		ENG_IDX = eNG_IDX;
	}
	public int getS_IDX() {
		return S_IDX;
	}
	public void setS_IDX(int s_IDX) {
		S_IDX = s_IDX;
	}
	public int getL_IDX() {
		return L_IDX;
	}
	public void setL_IDX(int l_IDX) {
		L_IDX = l_IDX;
	}
	public int getREQ_MEMBER() {
		return REQ_MEMBER;
	}
	public void setREQ_MEMBER(int rEQ_MEMBER) {
		REQ_MEMBER = rEQ_MEMBER;
	}
	public int getHIT() {
		return HIT;
	}
	public void setHIT(int hIT) {
		HIT = hIT;
	}
	public int getCUR_MEMBER() {
		return CUR_MEMBER;
	}
	public void setCUR_MEMBER(int cUR_MEMBER) {
		CUR_MEMBER = cUR_MEMBER;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	public String getRP() {
		return RP;
	}
	public void setRP(String rP) {
		RP = rP;
	}
	
	@Override
	public String toString() {
		return "EnglishBoardVO [ENG_IDX=" + ENG_IDX + ", S_IDX=" + S_IDX + ", L_IDX=" + L_IDX + ", REQ_MEMBER="
				+ REQ_MEMBER + ", HIT=" + HIT + ", CUR_MEMBER=" + CUR_MEMBER + ", ID=" + ID + ", TITLE=" + TITLE
				+ ", CONTENT=" + CONTENT + ", REGDATE=" + REGDATE + ", FILE_NAME=" + FILE_NAME + ", RP=" + RP + "]";
	}
	
	
	
	
}
