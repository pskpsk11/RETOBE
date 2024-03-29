package kr.co.retobe.gmanager;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.EmailVO;
import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;

public interface GmanagerService {
	//common
	Map<String, Object> pay_chargeTotal();

	int totalCount();

	List<Map<String, Object>> qna(QnaVO qvo);
	//course
	boolean courseinsert(CourseVO vo, MultipartFile file, HttpServletRequest request);
	int update(CourseVO vo);
	CourseVO modcourse(int no);

	//
	Map<String, Object> courseListS(CourseVO vo);

	//customer
	public boolean customerinsert(NoticeVO vo);
	public boolean faqinsert(FaqVO vo);

	NoticeVO getNoticeDetail(int noticeNo);
	List<NoticeVO> getlist(NoticeVO vo);

	//페이지처리
	Map<String, Object> noticeList(NoticeVO vo);

	QnaVO getQnaDetail(int qnaNo);
	Map<String, Object> getQnaListReal(QnaVO vo);

	List<FaqVO> getfaqlist(FaqVO vo);

	int QnaReply (QnaVO vo);
	Map<String, Object> qnaList(QnaVO vo);
	//email
	Map<String, Object> memberListS(MemberVO vo);
	String memberEmail(int no);
	int sendEmail(EmailVO vo);
	Map<String, Object> emailList(EmailVO vo);
	int findMember (String email);

	//member
	MemberVO detail(int no);
	int update(MemberVO vo);

	Map<String, Object> cmemberList(MemberVO vo);
}