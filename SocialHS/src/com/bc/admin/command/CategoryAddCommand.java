package com.bc.admin.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.admin.AdminDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.share.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CategoryAddCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("==========CategoryAddCommand==========");
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("/imgs");
		System.out.println("/imgs : " + path);
		
		
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, //MultipartRequest에서 request 정보 사용
					path, //실제 파일을 저장하기 위한 경로
					10 * 1024 * 1024, //업로드 파일의 최대용량(byte 단위)
					"UTF-8", //인코딩 타입
					new DefaultFileRenamePolicy() //파일이름 중복처리
					);
			
			System.out.println("<h1>파일 업로드 결과 보기</h1>");
			System.out.println("<h2>bbs_type : "+mr.getParameter("bbs_type") +"</h2>");
			System.out.println("<h2>bbs_name : "+mr.getParameter("bbs_name") +"</h2>");
			System.out.println("<h2>f_name : "+mr.getParameter("f_name") +"</h2>");
			
			
			String bbs_name = mr.getParameter("bbs_name").toUpperCase();
			String bbs_type = mr.getParameter("bbs_type");
			
			File file = mr.getFile("f_name");
			System.out.println("<h2>파일이름 : "+file.getName()+"</h2>");
			
			File fileRename = new File(path+"/"+bbs_name+".png");
			if(file.renameTo(fileRename)) {
				System.out.println("이름변경 성공?!");
			}else {
				System.out.println("이름변경 실패..");
			}
			System.out.println("업로드 된 파일명="+path+"/"+fileRename.getName());
			
			
			System.out.println("<h2>파일크기 : "+file.length()+"</h2>");
			
			System.out.println("<h2>파일위치 : "+ file.getPath() + "</h2>");
			
			
			System.out.println("bbs_name : "+bbs_name);
			System.out.println("bbs_type : "+bbs_type);
			
			
			//DB입력부분 먼저 bbc_idx를 구한후  insert 시작
			int bbs_typeCnt = AdminDAO.getBBS_IDX(bbs_type);
			System.out.println("bbs_typeCnt : "+bbs_typeCnt);
			
			int bbs_idx= Integer.parseInt(bbs_type)+bbs_typeCnt+1;
			System.out.println("bbs_idx : "+bbs_idx);
			
			BbsCodeVO bbscodeVO = new BbsCodeVO();
			bbscodeVO.setBbs_idx(bbs_idx);
			bbscodeVO.setBbs_name(bbs_name);
			bbscodeVO.setBbs_type(Integer.parseInt(bbs_type));
			
			System.out.println("bbscodeVO : "+bbscodeVO);
			System.out.println("bbscode 입력 전");
			AdminDAO.insertCategory(bbscodeVO);
			System.out.println("bbscode 입력 완료");
			
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("==========CategoryAddCommand==========");
		return "Admin/A_allwriteList.jsp";
		
	}
	

}
