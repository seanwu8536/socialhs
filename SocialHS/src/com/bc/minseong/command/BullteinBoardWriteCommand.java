package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">>writecommand 까지 옴");
		String bb_idx = request.getParameter("bb_idx");
		String chk = request.getParameter("chk");
		
//		BoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
//		request.setAttribute("bbvo", bbvo);
		BoardVO bbvo = new BoardVO();
		bbvo.setTitle(request.getParameter("title"));
		bbvo.setContent(request.getParameter("content"));
		String path = null;
		if (chk == null) {
			System.out.println("널");
			path = "minseong/bullteinBoardWrite.jsp";
			System.out.println(path);
		} else {
			System.out.println("널 아님");
			System.out.println(bbvo);
			BullteinBoardDAO.insert(bbvo);
			
			
			path = "BullteinController?type=bullteinList";
			
		}
		return path;
	}
		
		


	}

