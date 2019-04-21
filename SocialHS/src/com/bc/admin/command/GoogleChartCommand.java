package com.bc.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.admin.AdminDAO;
import com.bc.main.vo.googleChartVO;
import com.bc.share.command.Command;

public class GoogleChartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("여기까지옴");
		
		List<googleChartVO> googleHobbyList = AdminDAO.getGoogleHobbyVO();
		List<googleChartVO> googleStudyList = AdminDAO.getGoogleStudyVO();
		
		System.out.println("googleHobbyList : "+googleHobbyList);
		System.out.println("googleStudyList : "+googleStudyList);
		
		request.setAttribute("googleHobbyList", googleHobbyList);
		request.setAttribute("googleStudyList", googleStudyList);
		
		
		return "Admin/A_googleChart.jsp";
	}

}
