package com.bc.controller;

import java.io.Console;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.jieun.command.SearchCommand;
import com.bc.main.command.MainWriteCommand;
import com.bc.main.command.slSearchCommand;
import com.bc.main.dao.BoardSearchDAO;
import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;


@WebServlet("/Search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		
		String path = null;
		Command comm;
		comm = null;
		
		if(type.equals("search")) {
			comm = new SearchCommand();
			
		}else if(type.equals("write")) {
			comm = new MainWriteCommand();
		}else if(type.equals("sl_search")) {
			comm = new slSearchCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		

	}

}
