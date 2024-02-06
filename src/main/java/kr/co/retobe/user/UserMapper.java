package kr.co.retobe.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.MemberVO;

@Mapper
public interface UserMapper {
	// 아이디 중복체크
		int dupId(String id);
		// 회원가입
		int regist(MemberVO vo);
		// 로그인
		MemberVO login(MemberVO vo);
		
		// 회원조회
		MemberVO detail(int no);
		// 회원수정
		int update(MemberVO vo);
		// 비밀번호 확인
		MemberVO pwdCheck(MemberVO mvo);
		// 회원탈퇴
		int quit(MemberVO mvo);

		// 아이디 찾기

		MemberVO findId(MemberVO vo);
		MemberVO findPwd(MemberVO vo);
		
		//임시비밀번호
		int updatePw(MemberVO vo);
		
		
		int cartInsert (BasketVO vo);
		List<Map> list(int no);		//목록 가져올 것.. join 강좌정보: , 레벨, 요일, 시간, 강좌 금액
		int delete(int no);			//cartPk 삭제
		int count (int no);			//id별 강좌 정보 
		CourseVO courseSelect (int no);
		int reviewTotal (int no);
		// 마이페이지 - 현재 수강중인 강의 목록 뽑아오기
		List<Map<String, Object>> currentCourseIndex(MemberVO user);
		// 마이페이지 - 수강신청 내역 뽑아오기
		List<Map<String, Object>> pastCourseIndex(MemberVO user);
		// 마이페이지 - 나의후기 내역 뽑아오기
		List<Map<String, Object>> myCourseAskIndex(MemberVO user);
		List<Map<String, Object>> askIndex(MemberVO user);
		int cqnaCount(MemberVO user);
		int qnaCount(MemberVO user);
		// 마이페이지 - 나의문의 내역 뽑아오기
		List<Map<String, Object>> myReviewIndex(MemberVO user);

}
