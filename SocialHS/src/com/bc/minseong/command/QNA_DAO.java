package com.bc.minseong.command;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.mybatis.DBService;

public class QNA_DAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	public static List<BoardVO> getMaplist(Map<String, Integer> map) {
		return getSql().selectList("QNA.q_Maplist", map);
	}
	
	public static List<BoardVO> getList() {
		List<BoardVO> list = getSql().selectList("QNA.QNAlist");
		return list;
		
	}
	public static BoardVO selectOne(String bb_idx) {
		BoardVO bbvo = getSql().selectOne("QNA.QNAone", bb_idx);
		return bbvo;
	}
	
	public static int insert(BoardVO bbvo) {
		int result = getSql().insert("QNA.QNAwrite", bbvo);
		return result;
	}
	
	public static int update(BoardVO bbvo) {
		int result = getSql().update("QNA.QNAupdate", bbvo);
		return result;
	}
	
	public static int delete(String bb_idx) {
		int result = getSql().delete("QNA.QNAdelete", bb_idx);
		return result;
	}
	
	public static int writeComment(BoardVO vo) {
		int result = getSql().insert("QNA.QNAwriteComment", vo);
		return result;
	}
	
	public static int deleteComment(String bb_idx) {
		int result = getSql().delete("QNA.QNAdeleteComment", bb_idx);
		return result;
	}
	
	
	
	//조회수 
	public static int updateHit(BoardVO bbvo) {
		return getSql().update("QNA.QNAhitVO", bbvo); 
	}
	
	public static int updateHit(int bb_idx) {
		return getSql().update("QNA.QNAhit", bb_idx);
	}

	
	//좋아요
	public static int updateGood(String bb_idx) {
		return getSql().update("QNA.q_goodVO", bb_idx);
	}
	
	public static int updateBad(String bb_idx) {
		return getSql().update("QNA.q_badVO", bb_idx);
	}

	
}
