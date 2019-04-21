package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAlistCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<BoardVO> list = QNA_DAO.getList();
		request.setAttribute("list", list);
		System.out.println("list : " + list);
		
		return "minseong/QNAlist.jsp";
	}

}
