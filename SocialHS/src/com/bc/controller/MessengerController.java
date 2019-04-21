package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.memInfoCommand;
import com.bc.main.command.memWriteCommand;
import com.bc.messenger.command.MessengerCommand;
import com.bc.messenger.command.MsnDelCommand;
import com.bc.messenger.command.MsnDetailCommand;
import com.bc.messenger.command.MsnInsCommand;
import com.bc.messenger.command.MsnWriteCommand;
import com.bc.share.command.Command;

/**
 * Servlet implementation class MessengerController
 */
@WebServlet("/MessengerController")
public class MessengerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String type = request.getParameter("type");
		System.out.println("type: "+ type);
		
		Command comm = null;
		String path = "";
		if (type.equals("msnList")) {
			comm = new MessengerCommand();
		} else if (type.equals("oneList")) {
			comm = new MsnDetailCommand();
		} else if (type.equals("delete")) {
			comm = new MsnDelCommand();
		} else if (type.equals("write")) {
			comm = new MsnWriteCommand();
		} else if (type.equals("writeOk")) {
			comm = new MsnInsCommand();
		} else if (type.equals("memInfo")) {
			comm = new memInfoCommand();
		} else if (type.equals("memWrite")) {
			comm = new memWriteCommand();
		}

		path = comm.exec(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
