package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAwriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO vo = new BoardVO();
		String id = request.getParameter("id");
		System.out.println("id: " + id);
		
		if (id == "") { 
			vo.setId("ANONYMOUS"); 
		} else { 
				vo.setId(id); 
				}
		
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		System.out.println("vo: " + vo);
		
		QNA_DAO.insert(vo);
		
		//return "QNA?type=QNAlist";
		return "/minseong/QNAlist.jsp";
		
	}

}
