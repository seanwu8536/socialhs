package com.bc.comment.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.mybatis.*;

public class CommentDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	public static List<CommentVO> getCommList(String bb_idx) {
		return getSql().selectList("comment.listComment",bb_idx);
	}
	
	public static int insertComment(CommentVO vo) {
		return getSql().insert("comment.CommentWrite",vo);	
	}
	
	public static int deleteComment(String bbc_idx) {
		return getSql().delete("comment.CommentDelete",bbc_idx);	
	}
	
	
	
	
	
	
	
	public static int b_deleteComment(String bb_idx) {
		return getSql().delete("comment.b_deleteComment",bb_idx);	
	}
	
	public static int f_deleteComment(String bb_idx) {
		return getSql().delete("comment.q_deleteComment", bb_idx);
	}
	
	public static int q_deleteComment(String bb_idx) {
		return getSql().delete("comment.q_deleteComment", bb_idx);
	}
	
	
	
	
	
	
	
	public static int deleteComBb_idx(String bb_idx) {
		return getSql().delete("comment.delBb_idx", bb_idx);
	}
	public static int updatePoint(String id) {
		return getSql().update("comment.updatePoint", id);
	}
	
	
}
