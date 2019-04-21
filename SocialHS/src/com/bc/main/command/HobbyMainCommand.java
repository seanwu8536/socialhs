package com.bc.main.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class HobbyMainCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String bbs_idx = request.getParameter("bbs_idx2");
		
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");	
		String hs = (String)session.getAttribute("hs");
		String l_idx = location.get(0).getL_Idx();
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
		
		Map<String, String> map = new HashMap<String, String>();
		if(hs.equals("hobby")) {
			hs = "h";
		}else if(hs.equals("study")) {
			hs = "s";
		}
		map.put("l_idx", l_idx);
		map.put("hs",hs); 
		
		
		System.out.println("===================bbs_idx================");
		System.out.println("bbs_idx : "+bbs_idx);
		System.out.println("===================bbs_idx================");
		if (bbs_idx == null) {					// 일반적인 경우
			List<HobbyBoardVO> HobbyList = HobbyBoardDAO.getMainCategoryList(map);
			request.setAttribute("MainList", HobbyList); //HobbyList는 HobbyMain에쓸 리스트를 저장한 객체 
			
			//MainList는 공용으로 사용하는 것이고 Main에서 사용할 객체들의 집합을 의미
		}else {									// 카테고리에서 넘어왔을 경우
			map.put("bbs_idx", bbs_idx);
			List<HobbyBoardVO> HobbyList = HobbyBoardDAO.getCategoryFromCategory(map);
			request.setAttribute("MainList", HobbyList); 
		}
		
		System.out.println("list : "+ list);
		session.setAttribute("SubLocation", list);
		return "HobbyMain.jsp";
	}

}
