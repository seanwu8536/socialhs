package com.bc.member;

import java.util.HashMap;
import java.util.Map;

public class Paging {
	private int nowPage = 1; //현재 페이지
	private int nowBlock = 1; //현재 블록 
	
	private int numPerpage = 5; //하나의 페이지에 게시되는 글의 수
	private int pagePerBlock = 5; //블록당 표시하는 페이지의 수
	
	private int totalRecord = 0; //총 게시물의 수 
	private int totalPage = 0; //전체 페이지의 수 
	private int totalBlock = 0; //전체 블록의 수
	
	private int begin = 0; //현재 페이지 상의 시작 글번호 
	private int end = 0; //현재 페이지 상의 마지막 글번호 
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호 
	private int endPage = 0; //현재 블록의 끝 페이지 번호 
	
	//전체 페이지 구하기 
	public void setTotalPage() {
		totalPage = totalRecord / numPerpage;
		if (totalRecord % numPerpage != 0) {
			totalPage++;
		}
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

	public int getNumPerpage() {
		return numPerpage;
	}

	public void setNumPerpage(int numPerpage) {
		this.numPerpage = numPerpage;
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

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
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