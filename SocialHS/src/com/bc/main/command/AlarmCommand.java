package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MainDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class AlarmCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int sumMsn = 0;
		int sumMem = 0;
		int sumCom = 0;
		int sum = 0;
		List<MessengerVO> msnAlm;
		List<BoardVO> memAlm;
		List<CommentVO> comAlm;
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		
//		System.out.println("세션 id: "+ vo.getId());
		msnAlm = MainDAO.getMsnAlm(vo.getId());
//		System.out.println("msnAlm: "+ msnAlm);
		memAlm = MainDAO.getMemAlm(vo.getId());
//		System.out.println("memAlm: "+ memAlm);
		comAlm = MainDAO.getComAlm(vo.getId());
//		System.out.println("comAlm: "+ comAlm);
//		
//		MS_IDX, SEND_ID, CHK
		String result = "{";
		if (msnAlm.size() != 0) {
		result += "\"msnAlm\":[";
			for (MessengerVO msn : msnAlm) {
				sumMsn += msn.getChk();
				result += "{";
				result += "\"ms_idx\" : \""+ msn.getMs_idx() +"\",";
				result += "\"chk\" : \""+ msn.getChk() +"\",";
				result += "\"send_id\" : \""+ msn.getSend_id() +"\"";
				result += "},";
			}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
//		BB_IDX, TITLE, CHK
		if (memAlm.size() != 0) {
			result += "\"memAlm\":[";
			for (BoardVO board : memAlm) {
				sumMem += board.getChk();
				result += "{";
				result += "\"bb_idx\" : \""+ board.getBb_idx() +"\",";
				result += "\"title\" : \""+ board.getTitle() +"\"";
				result += "},";
			}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
//		B.TITLE, C.ID, C.BBC_IDX, C.CHK
		if (comAlm.size() != 0) {
		result += "\"comAlm\":[";
		for (CommentVO com : comAlm) {
			sumCom += Integer.parseInt(com.getChk());
			result += "{";
			result += "\"title\" : \""+ com.getTitle() +"\",";
			result += "\"id\" : \""+ com.getId() +"\",";	// 댓글 쓴 사람 id
			result += "\"bbc_idx\" : \""+ com.getBbc_idx() +"\",";
			result += "\"bb_idx\" : \""+ com.getBb_idx() +"\"";
			result += "},";
		}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
		sum = sumMsn + sumMem + sumCom;
		result += "\"almCnt\":\""+sum+"\"";
		
		System.out.println("sum: "+ sum);
		result += "}";
		
		System.out.println(result);
		
		
		return result;
//		return sum+"";
	}

}
