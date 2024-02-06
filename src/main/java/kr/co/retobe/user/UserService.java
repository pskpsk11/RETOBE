package kr.co.retobe.user;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.MemberVO;

@Service
public interface UserService {

	boolean dupId(String id);
	boolean regist(MemberVO vo);
	MemberVO login(MemberVO vo);
	MemberVO detail(MemberVO vo);
	int update(MemberVO vo);
	MemberVO pwdCheck(MemberVO mvo);
	int quit(MemberVO mvo);
	//
	MemberVO findId(MemberVO vo);
	MemberVO findPwd(MemberVO vo);

	int updatePw(MemberVO vo);
	
	int basketInsert(BasketVO vo);
	int cartDelete(int cno); //cno= 강좌 pk
	Map<String, Object> cartList(int no);	//no = 회원 pk
	
	// 마이페이지 - 현재 수강중인 강의 목록 뽑아오기
	List<Map<String, Object>> currentCourseIndex(MemberVO user);
	// 마이페이지 - 수강신청 내역 뽑아오기
	List<Map<String, Object>> pastCourseIndex(MemberVO user);
	// 마이페이지 - 나의후기 내역 뽑아오기
	List<Map<String, Object>> myCourseAskIndex(MemberVO user);
	List<Map<String, Object>> askIndex(MemberVO user);
	// 마이페이지 - 나의문의 내역 뽑아오기
	List<Map<String, Object>> myReviewIndex(MemberVO user);
	
	CourseVO compList(int no);
	int compTotalReview(int no);
}
