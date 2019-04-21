package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.mybatis.DBService;

public class MainDeleteDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	public static int deleteB_board(String bb_idx){
		return getSql().delete("maindelete.delete",bb_idx);
	}
	
	public static int deleteComment(String bb_idx){
		return getSql().delete("maindelete.deleteComment",bb_idx);
	}
	
	public static int deleteApply(String bb_idx){
		return getSql().delete("maindelete.deleteAppy",bb_idx);
	}
	
	
	
	

	
}
