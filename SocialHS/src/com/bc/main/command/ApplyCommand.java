package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.ApplyDAO;
import com.bc.main.vo.ApplyVO;
import com.bc.main.vo.CommentVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class ApplyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		HobbyBoardVO viewVO = (HobbyBoardVO)session.getAttribute("viewVO");
		String hs = (String)session.getAttribute("hs");
		String hs_idx = "";
		String bb_idx = viewVO.getBb_idx();
		System.out.println("hs : "+hs);
		if(hs.equals("hobby")) {
			hs_idx = "h";
		}else if(hs.equals("study")) {
			hs_idx = "s";
		}
		memberVO member = (memberVO)session.getAttribute("memberVO");
		String id = member.getId();
		ApplyVO vo = new ApplyVO();
		vo.setBb_idx(bb_idx);
		vo.setId(id);
		
		System.out.println("vo : "+vo);
		ApplyDAO.apply(vo);
		System.out.println("apply 테이블 등록 완료");
		int cnt = ApplyDAO.updateCurrent(bb_idx);
		System.out.println("cnt : "+cnt);
		System.out.println("인원 변경 완료 완료");
		ApplyDAO.updateChk(bb_idx);
		System.out.println("chk+1 완료");
		
		HobbyBoardVO new_viewVO = HobbyBoardDAO.getViewVo(bb_idx);
		
		session.setAttribute("viewVO", new_viewVO);
		
		System.out.println("===========================bb_idx check ========================");
		System.out.println("bb_idx : "+bb_idx);
		
		//===============댓글 가져오기 ===================================
	      List<CommentVO> commentList = HobbyBoardDAO.getCommentVo(bb_idx);
	      System.out.println("commentList : "+commentList);
	      request.setAttribute("commentList", commentList);
	      
	      List<ApplyVO> applyList = HobbyBoardDAO.getApplyVo(bb_idx);
	      System.out.println("applyList : "+applyList);
	      session.setAttribute("applyList", applyList);
		
		return "view.jsp";
	}

}
