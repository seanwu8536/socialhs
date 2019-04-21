package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.ListCommand;
import com.bc.share.command.Command;
import com.bc.share.command.HobbyCommand;
import com.bc.share.command.StudyCommand;




@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String path = null;
		System.out.println("type : "+type);
		Command comm = null;
		
		if(type.equals("hobby")) {
			comm = new HobbyCommand();
		}
			else if(type.equals("study")) {
			comm = new StudyCommand();
		}
		
		path = comm.exec(request, response);
		
		// 카테고리 출력
		System.out.println("메인컨트롤러에서 받은 세션: "+ request.getSession().getAttribute("hs"));
		Command ListComm = new ListCommand();
		ListComm.exec(request, response);
		System.out.println("hsList: "+ request.getSession().getAttribute("hsList"));
		
		
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
