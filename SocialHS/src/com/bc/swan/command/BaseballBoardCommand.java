package com.bc.swan.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.BaseballDAO;
import com.bc.hobby.resource.BaseballPaging;
import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.share.command.Command;

public class BaseballBoardCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		String cntPerPage = request.getParameter("cntPerPage");
		int countAll = BaseballDAO.getCountAll();
		
		System.out.println("cPage: "+ cPage+ ", cntPerPage: "+ cntPerPage);
		System.out.println(countAll);
		
		Map<String, Integer> map = null;
		
		if (cPage.equals("") || cntPerPage.equals("")) {
			BaseballPaging paging = new BaseballPaging(countAll, 1, 3);
		} else {
			BaseballPaging paging = new BaseballPaging(countAll, Integer.parseInt(cPage), Integer.parseInt(cntPerPage));
			map = paging.getBeEnd();
		}
		
		List<BaseballBoardVO> list = BaseballDAO.getList(map);
//		List<BaseballBoardVO> list = BaseballDAO.getBaseList();
		request.setAttribute("list", list);
		
		
		return "swan/baseballBoard.jsp";
	}

}
