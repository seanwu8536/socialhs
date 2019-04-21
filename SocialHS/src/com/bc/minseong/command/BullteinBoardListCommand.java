package com.bc.minseong.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> list = BullteinBoardDAO.getList();
		request.setAttribute("list", list);
		System.out.println("BullteinBoardList : " + list);
		
		
		return "minseong/bullteinBoardList.jsp";
	}


}


