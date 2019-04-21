package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class FreeBoardDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		
		int result1 = FreeBoardDAO.deleteComment(bb_idx);
		int result2 = FreeBoardDAO.delete(bb_idx);
		System.out.println("result1: " + result1 + ", result2: " + result2);
		
		String path = "FreeController?type=freeList";
		return path;
	}

}
