package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.MainDeleteDAO;
import com.bc.main.dao.MainUpdateDAO;
import com.bc.main.dao.MainWriteDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class MainDeleteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		// TODO Auto-generated method stub
		System.out.println("여기 delete command-------------------------");
		HttpSession session = request.getSession();
		
		String bb_idx = (String)request.getParameter("bb_idx");
		
		String hs = (String)session.getAttribute("hs");
		String hs_idx = "";
		System.out.println("hs : "+hs);
		if(hs.equals("hobby")) {
			hs_idx = "h";
		}else if(hs.equals("study")) {
			hs_idx = "s";
		}
		
		System.out.println("==============마지막 삭제 테스트!!!!!================");
		System.out.println("bb_idx : "+bb_idx);
		System.out.println("1.댓글 먼저 삭제 전");
		MainDeleteDAO.deleteComment(bb_idx);
		System.out.println("1.댓글 삭제 완료");
		System.out.println("2.신청자 삭제 전");
		MainDeleteDAO.deleteComment(bb_idx);
		System.out.println("2.신청자 삭제 완료");
		System.out.println("3.메인 삭제 전");
		MainDeleteDAO.deleteB_board(bb_idx);
		System.out.println("3.메인 삭제 완료");
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
		System.out.println("location : "+location);
		return "LocationController?hs="+hs+"&location="+location.get(0).getL_Idx();
	}

}
