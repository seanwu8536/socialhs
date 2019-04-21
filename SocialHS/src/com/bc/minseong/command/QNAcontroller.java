package com.bc.minseong.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

@WebServlet("/QNA")
public class QNAcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	
	private void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String path = null;
		Command comm = null;
		
		if(type.equals("QNAlist")) {
			comm = new QNAlistCommand();
			System.out.println("QNAlist");
		}else if(type.equals("QNAone")) {
			comm = new QNAoneCommand();
			System.out.println("QNAone 컨트롤러");
		}else if(type.equals("QNAupdate")) {
			comm = new QNAupdateCommand();
		}else if(type.equals("QNAupdateOK")) {
			comm = new QNAupdateOkCommand();
		}else if(type.equals("QNAwrite")) {
			comm = new QNAwriteCommand();
		}else if(type.equals("QNAdelete")) {
			comm = new QNAdeleteCommand();
		}else if(type.equals("QNAgood")) {
			comm = new QNAgoodCommand();
		}else if(type.equals("QNAbad")) {
			comm = new QNAbadCommand();
		}else if(type.equals("q_writeOk")) {
			comm = new q_CommentWriteCommand();
		}else if(type.equals("q_dlelteOk")) {
			comm = new q_CommentDeleteCommand();
		}
		
		path = comm.exec(request, response);
		System.out.println("path: "+ path);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
}
