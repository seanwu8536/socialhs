package com.bc.minseong.command;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class BullteinBoardDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	public static List<BoardVO> getMaplist(Map<String, Integer> map) {
		return getSql().selectList("bulltein.Maplist", map);
	}
	
	
	//공지 게시판 리스트
	public static List<BoardVO> getList() {
		List<BoardVO> list = getSql().selectList("bulltein.BullteinList");
		return list;
		
	}

	//게시글 상세페이지
	public static BoardVO selectOne(String bb_idx) {
		BoardVO bbvo = getSql().selectOne("bulltein.BullteinOne", bb_idx);
		return bbvo;
	}
	
	
	//게시글 작성
	public static int insert(BoardVO bbvo) {
		int result = getSql().insert("bulltein.BullteinWrite", bbvo);
		return result;
	}
	
	
	//게시글 수정
	public static int update(BoardVO bbvo) {
		int result = getSql().update("bulltein.BullteinUpdate", bbvo);
		return result;
	}
	
	//게시글 삭제
	public static int delete(String bb_idx) {
		int result = getSql().delete("bulltein.BullteinDelete", bb_idx);
		return result;
	}
	
	//게시글에 딸린 댓글 삭제
	public static int deleteComment(String bb_idx) {
		int result = getSql().delete("BullteinDeleteComment", bb_idx);
		return result;
	}
	
	
	
	//조회수 
	public static int updateHit(BoardVO bbvo) {
		return getSql().update("hitVO", bbvo); 
	}
	
	public static int updateHit(int bb_idx) {
		return getSql().update("hit", bb_idx);
	}

	
	//좋아요
	public static int updateGood(String bb_idx) {
		return getSql().update("bulltein.goodVO", bb_idx);
	}
	
	public static int updateBad(String bb_idx) {
		return getSql().update("bulltein.badVO", bb_idx);
	}
	
	//페이징
	public static int getTotalCount() {
		int totalCount = getSql().selectOne("bulltein.totalCount");
		return totalCount;
	}
	
}
