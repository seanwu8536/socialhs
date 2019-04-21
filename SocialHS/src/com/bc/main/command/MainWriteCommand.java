package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MainWriteDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class MainWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		//여기에 카테고리(농구 , 축구, 등) 지역도 필요함(서울, 경기도 등) 필요함!! 
		String hs = (String)session.getAttribute("hs");
		String hs_idx = ""; //여기 hs구분
		String bbs_type = "";
		List<LocationVO> LocationAll = (List<LocationVO>)session.getAttribute("locationAll");
		List<SubLocationVO> SubLocationAll = (List<SubLocationVO>)session.getAttribute("SubLocation");
		List<SubLocationVO> listSubAll2 = (List<SubLocationVO>)session.getAttribute("listSubAll2");
		System.out.println("=============================");
		System.out.println("hs : "+hs);
		if(hs.equals("hobby")) {
			hs_idx = "h";
			bbs_type = "300";
		}else if(hs.equals("study")) {
			hs_idx = "s";
			bbs_type = "700";
		}
		
		List<BbsCodeVO> bbs_code_list = MainWriteDAO.getBbsCodeList(bbs_type);
		
		
		request.setAttribute("bbs_code_list", bbs_code_list);
		request.setAttribute("LocationAll", LocationAll);
		request.setAttribute("SubLocationAll", listSubAll2);
		
		System.out.println("LocationAll : "+LocationAll);
		System.out.println("SubLocationAll : "+SubLocationAll);
		System.out.println("listSubAll2 : "+listSubAll2);
		System.out.println("hs_idx : "+ hs_idx);
		System.out.println("bbs_code_list : "+ bbs_code_list);
		return "write.jsp";
	}

}
