package com.bc.hobby.resource;

import java.util.HashMap;
import java.util.Map;

public class BaseballPaging {
	
	/*
	최종적으로 전달해 주어야 할 값
	현재페이지, 시작페이지, 끝페이지
	
	전체페이지 / 페이지 당 게시글 -> if문 써서 총 페이지 갯수 구함
	select문으로 rownum을 붙여 rownum 이용하여 가져옴
	
	begin ~ end 까지의 게시글 가져옴
	
	1 2 3 4 5 6 7 8 9 10
	
	4
	
	1 2 3 4 
	3
	4
	
	3%4 = 3
	2 % 4 = 2
	6 % 4 = 2
	begin = (현재페이지 - (현재페이지 % cntPerBlock) - 1)
	
	5 6 7 8 
	7
	4
	
	9 10
	
	*/
	
	private int cPage;
	
	private int begin;
	private int end;
	private int beginPage;
	private int endPage;
	
	private int total;
	private int totalPage;
	private int cntPerPage;
	
	private int cntPerBlock;
	
	public BaseballPaging(int total, int cPage, int cntPerPage){
		setTotal(total);
		setcPage(cPage);
		setCntPerPage(cntPerPage);
		
		setCntPerBlock(5);		// 블럭당 페이지 갯수
		
		double tot = getTotal();
		double cntPage = getCntPerPage();
		
		int totalP = (int)Math.ceil(tot / cntPage);
		System.out.println("totalP: "+ totalP);
		setTotalPage(totalP);
	}
	
	public Map<String, Integer> getBeEnd() {
		Map<String, Integer> map = new HashMap<>();
		
//		begin = (((현재페이지 - 1) / cpb) * cpb + 1)
		int cP = getcPage();
		int cpb = getCntPerBlock();
		
		int beginP = ((int)((cP - 1) / cpb))*cpb + 1;
		int endP = beginP  + (cpb - 1);
		setBeginPage(beginP);
		if (endP > getTotalPage()) {
			setEndPage(getTotalPage());
		} else {
			setEndPage(endP);
		}
		System.out.println("시작페이지: "+ beginP);
		System.out.println("끝 페이지: "+ endP);
		setEnd(cPage * cntPerPage);
		setBegin(getEnd() - cntPerPage + 1);
		map.put("begin", begin);
		map.put("end", end);
		
		return map;
	}
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
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

	public int getTotalPage() {
		return totalPage;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getCntPerBlock() {
		return cntPerBlock;
	}

	public void setCntPerBlock(int cntPerBlock) {
		this.cntPerBlock = cntPerBlock;
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
