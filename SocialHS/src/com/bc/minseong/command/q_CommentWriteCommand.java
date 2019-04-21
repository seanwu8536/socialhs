package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class q_CommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if(id =="") {
			id = "ANONYMOUS";
		}
		
		String bb_idx = request.getParameter("bb_idx");
		String cPage = request.getParameter("cPage");
		
		CommentVO vo = new CommentVO();
		vo.setId(id);
		vo.setBb_idx(bb_idx);
		vo.setContent(request.getParameter("content"));
		CommentDAO.insertComment(vo);
		
		return "QNA?type=QNAone&bb_idx"+bb_idx;
	}

}
