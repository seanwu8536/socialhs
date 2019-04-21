package com.bc.comment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.comment.dao.CommentDAO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentDeleteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("댓글삭제처리부분");
		HobbyBoardVO viewVO = (HobbyBoardVO)session.getAttribute("viewVO");
		String bb_idx = viewVO.getBb_idx();
		
		String bbc_idx = request.getParameter("bbc_idx");
		System.out.println("bbc_idx : "+ bbc_idx);
		CommentDAO.deleteComment(bbc_idx);
		System.out.println("댓글 삭제 완료");
		return "HobbyController?type=view&bb_idx="+bb_idx;
	}
	

}
