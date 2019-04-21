package com.bc.messenger.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.admin.AdminVO;
import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnInsCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		//memberVO vo = (memberVO)session.getAttribute("memberVO");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String send_id = "";
		String recv_id = request.getParameter("recv_id");
		
		String path = "";
				
		if(session.getAttribute("memberVO")==null) {
			AdminVO avo = (AdminVO)session.getAttribute("AdminVO");
			send_id = avo.getId();
			path = "Admin/A_allmemberList.jsp";
		}else {
			memberVO vo = (memberVO)session.getAttribute("memberVO");
			send_id = vo.getId();
			path = "MessengerController?type=msnList";
		}
		
		System.out.println("title : "+ title);
		System.out.println("content : "+ content);
		System.out.println("send_id : "+ send_id);
		System.out.println("recv_id : "+ recv_id);
		
		
		
		MessengerVO msgVO = new MessengerVO();
		msgVO.setTitle(title);
		msgVO.setContent(content);
		msgVO.setSend_id(send_id);
		msgVO.setRecv_id(recv_id);
		
		MessengerDAO.insertMsg(msgVO);
		System.out.println("path : " + path);
		
		return path;
	}

}
