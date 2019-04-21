package com.bc.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.admin.command.CategoryAddCommand;
import com.bc.admin.command.GoogleChartCommand;
import com.bc.admin.command.a_delCommand;
import com.bc.admin.command.allListCommand;
import com.bc.admin.command.allmemberInfoCommand;
import com.bc.admin.command.categoryAddPageCommand;
import com.bc.admin.command.hobbylistCommand;
import com.bc.admin.command.infoCommand;
import com.bc.admin.command.searchCommand;
import com.bc.admin.command.studylistCommand;
import com.bc.share.command.Command;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
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
		System.out.println("검색어: "+ request.getParameter("search"));
		System.out.println("controller id : " + request.getParameter("id"));
		Command comm = null;
		
		if (type.equals("allList")) {
			comm = new allListCommand();
		} else if (type.equals("hobbylist")) {
			comm = new hobbylistCommand();
		} else if (type.equals("studylist")) {
			comm = new studylistCommand();
		} else if (type.equals("allmemberInfo")) {
			comm = new allmemberInfoCommand();
		} 
		else if (type.equals("search")) {
			comm = new searchCommand();
		} else if (type.equals("info")) {
			comm = new infoCommand();
		} else if (type.equals("del")) {
			comm = new a_delCommand();
		}else if(type.equals("categoryAdd")) {
			comm = new CategoryAddCommand();
		}else if (type.equals("categoryAddPage")) {
			//카테고리 추가 페이지 이동처리
			comm = new categoryAddPageCommand();
		}else if(type.equals("googleChart")) {
			comm = new GoogleChartCommand();
		}
		
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
