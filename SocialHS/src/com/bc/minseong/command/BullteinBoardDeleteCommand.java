package com.bc.minseong.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.share.command.Command;

public class BullteinBoardDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		
		CommentDAO.b_deleteComment(bb_idx);
		BullteinBoardDAO.delete(bb_idx);
		
		System.out.println("공지 삭제는 되는데");
		return "BullteinController?type=bullteinList";
		
	}

}
