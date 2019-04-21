package com.bc.minseong.command;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class FreeBoardDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	
	public static List<BoardVO> getMaplist(Map<String, Integer> map) {
		return getSql().selectList("free.f_Maplist", map);
	}
	
	
	//공지 게시판 리스트
	public static List<BoardVO> getList() {
		List<BoardVO> list = getSql().selectList("free.FreeList");
		return list;
		
	}

	//게시글 상세페이지
	public static BoardVO selectOne(String bb_idx) {
		BoardVO bbvo = getSql().selectOne("free.FreeOne", bb_idx);
		return bbvo;
	}
	
	
	//게시글 작성
	public static int insert(BoardVO fvo) {
		int result = getSql().insert("free.FreeWrite", fvo);
		return result;
	}
	
	
	//게시글 수정
	public static int update(BoardVO fvo) {
		int result = getSql().update("free.FreeUpdate", fvo);
		return result;
	}
	
	//게시글 삭제
	public static int delete(String bb_idx) {
		int result = getSql().delete("free.FreeDelete", bb_idx);
		return result;
	}
	
	//댓글 삭제
	public static int deleteComment(String bb_idx) {
		int result = getSql().delete("free.FreeDeleteComment", bb_idx);
		return result;
	}
	
	//조회수 
	public static int updateHit(BoardVO bbvo) {
		return getSql().update("f_hitVO", bbvo); 
	}
	
	public static int updateHit(int bb_idx) {
		return getSql().update("f_hit", bb_idx);
	}

	
	//좋아요
	public static int updateGood(String bb_idx) {
		return getSql().update("free.f_goodVO", bb_idx);
	}
	
	public static int updateBad(String bb_idx) {
		return getSql().update("free.f_badVO", bb_idx);
	}
	
	
	
	
	
	//게시물(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = getSql().selectOne("free.totalCount");
		return totalCount;
	}

	
	
	
	
	
//	public static int getTotalCount() {
//		int totalCount = getSql().selectOne("totalCount");
//		return totalCount;
//	}
	
	
}
