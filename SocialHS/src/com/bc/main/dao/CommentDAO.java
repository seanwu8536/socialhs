package com.bc.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.CommentVO;
import com.bc.mybatis.DBService;

public class CommentDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	public static List<CommentVO> getCommList(String bb_idx) {
		List<CommentVO> cList = getSql().selectList("comment.CommentList", bb_idx);
		return cList;
	}
	
	public static int insertComment(CommentVO cvo) {
		int result = getSql().update("comment.CommentWrite", cvo);
		return result;
	}
	
	public static int deleteComment(String bbc_idx) {
		int result = getSql().delete("comment.CommentDelete", bbc_idx);
		return result;
	}
	

	
}