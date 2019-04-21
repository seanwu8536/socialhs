package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.AlarmCommand;
import com.bc.share.command.Command;	

/**
 * Servlet implementation class AlarmController
 */
@WebServlet("/AlarmController")
public class AlarmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		Command comm = new AlarmCommand();
		String result = comm.exec(request, response);
		
		System.out.println("result: "+ result);
		
		response.getWriter().println(result);
		response.getWriter().close();
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
