package com.bc.wonho.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.BaseballDAO;
import com.bc.hobby.resource.BaseballPaging;
import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;
import com.bc.study.dao.AttendanceDAO;
import com.bc.study.vo.AttendanceBoardVO;

public class SubLocationCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		/*SubLocationController?type=sub&l_idx=${listSubAll.getL_idx() }&sl_idx=${listSubAll.getSl_idx()}&cPage=1*/
		String sl_idx = request.getParameter("sl_idx");
		String cPage = request.getParameter("cPage");
		String cntPerPage = request.getParameter("cntPerPage");
		String hs = (String)session.getAttribute("hs");
		hs = hs.substring(0, 1);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("hs", hs);
		map.put("sl_idx", sl_idx);
		
		int countAll = SubLocationDAO.getCountAll(map);
		
		Map<String, Integer> PagingMap = null;
		if (cPage.equals("") || cntPerPage.equals("")) {
			BaseballPaging paging = new BaseballPaging(countAll, 1, 5);
		} else {
			BaseballPaging paging = new BaseballPaging(countAll, Integer.parseInt(cPage), Integer.parseInt(cntPerPage));
			PagingMap = paging.getBeEnd();
			String begin = String.valueOf(PagingMap.get("begin"));
			String end = String.valueOf(PagingMap.get("end"));
			map.put("begin", begin);
			map.put("end", end);
			
			request.setAttribute("pvo", paging);
		}
		List<BoardVO> subBoard = SubLocationDAO.getBoardCommList(map);
		System.out.println("subBoard: "+ subBoard);
		request.setAttribute("subBoard", subBoard);
		request.setAttribute("sl_idx", sl_idx);
		
		if (request.getParameter("l_idx") != null) {
			HashMap testMap = SubLocationDAO.getLoName(sl_idx);
			session.setAttribute("l_name", testMap.get("L_NAME"));
			session.setAttribute("sl_name", testMap.get("SL_NAME"));
		}
		
		return "wonho/sungbuk.jsp";
	}
}
