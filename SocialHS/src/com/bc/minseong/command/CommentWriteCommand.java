package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		if(id == "") {
			id = "ANONYMOUS";
		}
		System.out.println("id: " + id);
		
		String bb_idx = request.getParameter("bb_idx");
		String cPage = request.getParameter("cPage");
		System.out.println("댓글 입력 처리1");
		System.out.println("bb_idx : " + bb_idx);
		
		CommentVO cvo = new CommentVO();
		cvo.setId(id);
		cvo.setBb_idx(bb_idx);
		cvo.setContent(request.getParameter("content"));
		System.out.println("cvo :" + cvo);
		CommentDAO.insertComment(cvo);
		System.out.println("댓글 입력 처리2");
		return "BullteinController?type=bullteinOne&bb_idx="+bb_idx;
		

	}

}
