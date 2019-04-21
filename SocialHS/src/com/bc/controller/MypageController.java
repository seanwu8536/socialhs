package com.bc.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.command.joinCommand;
import com.bc.member.command.joinOkCommand;
import com.bc.member.command.loginCommand;
import com.bc.member.command.logoutCommand;
import com.bc.mypage.command.deleteCommand;
import com.bc.mypage.command.moreCommentCommand;
import com.bc.mypage.command.moreWriteCommand;
import com.bc.mypage.command.myPageCommand;
import com.bc.mypage.command.updateCommand;
import com.bc.mypage.command.updateMyinfoCommand;
import com.bc.share.command.Command;

@WebServlet("/MypageController")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String path = null;
		System.out.println("type : "+type);
		Command comm = null;
		
		if (type.equals("myPage")) {
			comm = new myPageCommand();
		}
		
		else if (type.equals("moreWrite")) {
			comm = new moreWriteCommand();
		}
		else if (type.equals("moreComment")) {
			comm = new moreCommentCommand();
		}
		
		else if (type.equals("update")) {
			comm = new updateCommand();
		} else if (type.equals("updateOk")) {
			comm = new updateMyinfoCommand();
		}
		else if (type.equals("delete")) {
			//회원탈퇴
			comm = new deleteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
