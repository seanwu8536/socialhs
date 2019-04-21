package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.share.command.Command;

public class QNAdeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		QNA_DAO.deleteComment(bb_idx);
		QNA_DAO.delete(bb_idx);
		return "QNA?type=QNAlist";
	}

}
