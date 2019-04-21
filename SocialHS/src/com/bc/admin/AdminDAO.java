package com.bc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.googleChartVO;
import com.bc.member.memberVO;
import com.bc.mybatis.DBService;

public class AdminDAO {
private static SqlSession ss;
		
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//아이디 조회
	public static AdminVO selectAid (String id) {
		return getSql().selectOne("admin.Aidchk", id);
	}
	
	//전체 게시글 수(cnt) 조회
	public int getWriteCount() {
		int totalCount = getSql().selectOne("admin.allWriteCount");
		return totalCount;
		
	}
	
	//전체 게시글 조회
	public static List<A_AllBoardVO> getAllList(Map<String, String> map) {
		return getSql().selectList("admin.allList", map);
	}
	
	//전체 회원들 수(cnt) 조회
	public int getMemberCount() {
		int membertotCnt = getSql().selectOne("admin.allMemberCount");
		return membertotCnt;
	}
	
	//전체 회원 리스트 조회
	public static List<memberVO> getAllmemberList(Map<String, String> map) {
		return getSql().selectList("admin.allmemberInfo", map);
	}
	
	//(취미)페이지 수(cnt) 조회 
	public int getHobbyCount() {
		int hobbytotCnt = getSql().selectOne("admin.allHobbyCount");
		return hobbytotCnt;
	}
	
	//(취미)게시글 조회 
	public static List<A_AllBoardVO> getAllhobbyList(Map<String, String> map) {
		return getSql().selectList("admin.allhobbyList", map);
	}
	
	//(스터디)페이지 수(cnt) 조회
	public int getStudyCount() {
		int studytotCnt = getSql().selectOne("admin.allStudyCount");
		return studytotCnt;
	}
	
	//(스터디)게시글 조회 
	public static List<A_AllBoardVO> getAllstudyList(Map<String, String> map) {
		return getSql().selectList("admin.allstudyList", map);
	}
	
	
	//제목/내용으로 검색 
	public static List<A_AllBoardVO> searchlist(String search) {
		Map<String, String> map = new HashMap<>();
		map.put("title", search);
		map.put("content", search);
		return getSql().selectList("admin.searchlist", map);
	}
	
	//제목/내용으로 검색 rownum
	public static List<A_AllBoardVO> getSearchWrite(Map<String, String> map) {
		return getSql().selectList("admin.searchWrite", map);
	}
	
	public static List<memberVO> searchId(String id) {
		return getSql().selectList("admin.idcnt", id);
	}
	
	//아이디로 검색 
	public static List<memberVO> getsearchId(Map<String, String> mapid) {
		return getSql().selectList("admin.searchId", mapid);
	}
	
	//---------------------------category추가부분-------------------
	public static int getBBS_IDX(String bbs_type) {
		return getSql().selectOne("admin.getBBS_IDX",bbs_type);
	}
	
	public static int insertCategory(BbsCodeVO bbscodeVO) {
		return getSql().insert("admin.insertCategory", bbscodeVO);
	}
	
	//------------------------------googleChart-------------
	
	public static List<googleChartVO> getGoogleHobbyVO(){
		return getSql().selectList("admin.googleChartHobbyVO");
	}
	
	public static List<googleChartVO> getGoogleStudyVO(){
		return getSql().selectList("admin.googleChartStudyVO");
	}
	
}
