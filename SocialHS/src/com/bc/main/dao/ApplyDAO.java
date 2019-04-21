package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.vo.ApplyVO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.mybatis.DBService;

public class ApplyDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	public static int apply(ApplyVO vo){
		System.out.println("check1121212");
		return getSql().insert("apply.insertApply",vo);
	}
	
	public static int updateCurrent(String bb_idx) {
		System.out.println("check123123");
		return getSql().update("apply.updateCurrent", bb_idx);
	}
	
	public static int cancel(ApplyVO vo) {
		System.out.println("check cancel");
		System.out.println("cancel vo : "+vo);
		return getSql().delete("apply.deleteApply",vo);
	}
	
	public static int minusCurrent(String bb_idx) {
		System.out.println("check minusCurrent");
		return getSql().update("apply.minusCurrent", bb_idx);
	}
	
	
	// 신청시 chk+1
	public static int updateChk(String bb_idx) {
		return getSql().update("apply.updateChk", bb_idx);
	}

	
}
