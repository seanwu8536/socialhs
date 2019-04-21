package com.bc.comment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.comment.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentWriteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String content = request.getParameter("content");
		String bb_idx = request.getParameter("bb_idx");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		CommentVO vo = new CommentVO();
		vo.setBb_idx(bb_idx);
		vo.setContent(content);
		vo.setId(id);
		vo.setPw(pw);
		System.out.println("comment vo : "+vo);
		CommentDAO.insertComment(vo);
		System.out.println("====comment 입력 완료====");
		
		System.out.println("=====comment 5점 주기 =========");
		CommentDAO.updatePoint(id);
		System.out.println("완료");
		System.out.println("=====comment 5점 주기 =========");
		
		return "HobbyController?type=view&bb_idx="+bb_idx;
	}
	

}
