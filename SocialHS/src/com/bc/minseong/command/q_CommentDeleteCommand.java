package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class q_CommentDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bbc_idx = request.getParameter("bbc_idx");
		String bb_idx = request.getParameter("bb_idx");
		System.out.println("이까지만 오시죠");
		CommentVO cvo = new CommentVO();
		CommentDAO.deleteComment(bbc_idx);
		return "QNA?type=QNAone&bb_idx"+bb_idx;
	}

}
