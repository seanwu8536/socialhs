package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class FreeBoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		BoardVO fvo = new BoardVO();
		String id = request.getParameter("id");
		if(id == "") {
			fvo.setId("ANONYMOUS");
		} else {
			fvo.setId(id);
		}
		fvo.setTitle(request.getParameter("title"));
		fvo.setContent(request.getParameter("content"));
		System.out.println("fvo: " + fvo);
		String path = null;
		
		FreeBoardDAO.insert(fvo);
		
		path = "FreeController?type=freeList";
		
		return path;

	}
}