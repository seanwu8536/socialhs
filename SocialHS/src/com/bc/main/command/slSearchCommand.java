package com.bc.main.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.resource.BaseballPaging;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class slSearchCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Map<String, String> map = new HashMap<>();
		
		String sl_idx = request.getParameter("sl_idx");
		request.setAttribute("sl_idx", sl_idx);
		String keyword = request.getParameter("keyword");
		String cat = request.getParameter("select");
		
		String cPage = request.getParameter("cPage");
		String cntPerPage = request.getParameter("cntPerPage");
		String hs = (String)session.getAttribute("hs");
		hs = hs.substring(0, 1);
		
		System.out.println("sl_idx: "+ sl_idx );
		System.out.println("keyword: "+ keyword);
		System.out.println("cat: "+ cat);
		System.out.println("cPage: "+ cPage);
		System.out.println("cntPerPage: "+ cntPerPage);
		System.out.println("hs: "+ hs);
		
		
		
		
		if (cPage == null) {
			cPage = "1";
		}
		if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		map.put("sl_idx", sl_idx);
		map.put("keyword", keyword);
		map.put("cat", cat);
		map.put("hs", hs);
		int countAll = SubLocationDAO.sl_searchCnt(map);
		
		Map<String, Integer> PagingMap = null;
		BaseballPaging paging = new BaseballPaging(countAll, Integer.parseInt(cPage), Integer.parseInt(cntPerPage));
		PagingMap = paging.getBeEnd();
		String begin = String.valueOf(PagingMap.get("begin"));
		String end = String.valueOf(PagingMap.get("end"));
		map.put("begin", begin);
		map.put("end", end);
		
		request.setAttribute("pvo", paging);
		
		List<BoardVO> list = SubLocationDAO.sl_searchList(map);
		request.setAttribute("subBoard", list);
		
		
		return "wonho/sungbuk.jsp";
	}

}
