package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.mybatis.DBService;

public class MessengerDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	public static List<MessengerVO> getList(String id) {
		return getSql().selectList("socialhs.msnList", id);
	}
	
	public static MessengerVO getOne(String ms_idx) {
		return getSql().selectOne("socialhs.msnOne", ms_idx);
	}
	
	public static int updateChk(String ms_idx) {
		return getSql().update("socialhs.updateChk", ms_idx);
	}
	
	public static int deleteMsg(String ms_idx) {
		return getSql().delete("socialhs.deleteMsg", ms_idx);
	}
	
	public static int insertMsg(MessengerVO vo) {
		return getSql().insert("socialhs.insertMsg", vo);
	}
	
}
