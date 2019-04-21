package com.bc.study.vo;

public class PagingVO {
	private int nowPage = 1;         //현재 페이지
	private int nowBlock = 1; 		 //현재 블럭
	private int numPerPage = 5;     //한 페이지에 들어갈 게시물 수
	private int pagePerBlock = 3;    //한 블럭에 들어갈 페이지 수
	private int totalRecord = 0;     //전체 게시물 수
	private int totalPage = 0;       //전체 페이지 수
	private int totalBlock = 0;      //전체 블럭 수
	private int beginContent = 0;    //현재 페이지 첫 글번호
	private int endContent = 0;      //현재 페이지 끝 글번호
	private int beginPage = 0;       //현재 블럭의 시작 페이지
	private int endPage = 0;         //현재 블럭의 마지막 페이지
	
	public void setTotalPage() { 
		//전체 페이지 = 전체 게시물 수 / 페이지당 게시물 수
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) totalPage++;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBeginContent() {
		return beginContent;
	}

	public void setBeginContent(int beginContent) {
		this.beginContent = beginContent;
	}

	public int getEndContent() {
		return endContent;
	}

	public void setEndContent(int endContent) {
		this.endContent = endContent;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	
	
}
