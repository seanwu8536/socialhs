package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class FreeBoardUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		System.out.println("bb_idx 요까지는 가자: " + bb_idx);
		
		
		BoardVO bvo = new BoardVO();
		bvo.setBb_idx(Integer.parseInt(bb_idx));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));
		System.out.println("bvo 요까지는 가자: " + bvo);
		
		int result = FreeBoardDAO.update(bvo);
		
		String path = "FreeController?type=freeOne&bb_idx="+ bb_idx;
		
		return path;
	}

}
