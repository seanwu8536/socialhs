package com.bc.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.bc.admin.AdminVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.mybatis.DBService;

public class memberDAO {
	
	private static SqlSession ss;
	memberVO vo = new memberVO();
	AdminVO avo = new AdminVO();
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//아이디 조회
	public static memberVO selectId (String id) {
		return getSql().selectOne("memberdata.idchk", id);
	}
	
	//아이디 조회(관리자인지 확인) 
	public static AdminVO selectAid (String id) {
		return getSql().selectOne("admin.Aidchk", id);
	}
	
	//로그인시 아이디, 비밀번호 체크
	public int loginCheck(String id, String pw) {
		vo = selectId(id);
		avo = selectAid(id);
		
		int chk = -1;
		System.out.println("회원 : "+vo);
		System.out.println("관리자 : " +avo);
		
		//관리자 로그인 
		if (vo != null) {
			chk = memberlogin(vo, pw);
			return chk;
		} else if (avo != null) {
			chk = adminlogin(avo, pw);
			return chk;
		} else {
			chk = -1;
			return chk;
		}
		
	}

	
	public static int memberlogin(memberVO id, String pw) {
		int chk = 0;
			if (id.getPw().equals(pw)) {
				chk = 1; //비밀번호 일치 
			} else {
				chk = 0;
			}
		return chk;
	}
	
	public static int adminlogin(AdminVO id, String pw) {
		int chk = 0;
			if (id.getPw().equals(pw)) {
				chk = 2;
			} else {
				chk = 0;
			}
		return chk;
	}
	
	//회원가입시 아이디 중복체크 
	public boolean idCheck(String id) {
		boolean chk = false;
		vo = selectId(id);
		System.out.println("vo: " + vo);
		
		if (vo == null) {
			chk = false;
		} else if (vo.getId().equals(id)) {
			//아이디 중복일때(DB상에 아이디 있음)
			chk = true;
		} else {
			chk = false;
		}
		return chk;
		
	}
	
	//회원가입
	public static int join(memberVO vo) {
		return getSql().insert("memberdata.join", vo);
	}
	
	//내 정보 수정 
	public static int update(memberVO vo) {
		return getSql().update("memberdata.updateMyinfo", vo);
		
	}
	
	//회원탈퇴
	public static int delete(String id) {
		return getSql().delete("memberdata.deleteMyinfo", id);
	}
	
	//(mypage)전체 게시글 수 조회 (B_Board) COUNT 
	public int getTotalCount(String id) {
		int totalCount = getSql().selectOne("memberdata.mypagetotalCnt", id);
		return totalCount;
	}
	//(mypage)전체 댓글 수 조회 (BB_COMMENT) COUNT 
	public int getTotCommentCnt(String id) {
		int totCommCnt = getSql().selectOne("memberdata.mypagetotalCommCnt", id);
		return totCommCnt;
	}
	
	
		
	//(mypage)전체 게시글 조회 
	public static List<BoardVO> getMypageList(Map<String, String> map) {
		return getSql().selectList("memberdata.mylist", map);
	}
	
	//(mypage)전체 댓글 조회
	public static List<CommentVO> getMypageCommList(Map<String, String> map) {
		return getSql().selectList("memberdata.myCommList", map);
	}
	
	//(mypage)내가 쓴 글 상세보기 
	public static BoardVO selectOne(String id) {
		return getSql().selectOne("memberdata.myWrite", id);
	}
	
}
