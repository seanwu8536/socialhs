package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.admin.AdminVO;
import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;

/**
 * Servlet implementation class MsnCloseController
 */
@WebServlet("/MsnCloseController")
public class MsnCloseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	public static void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		//memberVO vo = (memberVO)session.getAttribute("memberVO");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String send_id = "";
		String recv_id = request.getParameter("recv_id");
		
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		if (vo == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요')");
			out.println("window.close()");
			out.println("</script>");
		} else {
			send_id = vo.getId();
		}
		
		String path = "";
				
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
		
		
		out.println("<script>");
		out.println("alert('보내기 성공')");
		out.println("window.close();");
		out.println("</script>");
		
	}
}
