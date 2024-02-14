package kr.co.retobe.gmanager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.EmailVO;
import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;

@Mapper
public interface GmanagerMapper {
	//common
	Map<String, Object> pay_chargeTotal();

	int totalCount();

	List<Map<String, Object>> qna(QnaVO qvo);
	//course
	int courseinsert(CourseVO vo);
	int courseUpdate (CourseVO vo);
	CourseVO modcourse(int no);

	//
	int courseCount(CourseVO vo);
	List<CourseVO> courseList(CourseVO vo);
	//customer
	public int customerinsert(NoticeVO vo);
	public int faqinsert(FaqVO vo);
	public int noticeCount(NoticeVO vo);

	NoticeVO NoticeDetail(int noticeNo);
	List<NoticeVO> getlist(NoticeVO vo);	

	//페이지처리
	List<NoticeVO> noticeList(NoticeVO vo);

	QnaVO QnaDetail(int qnaNo);
	List<QnaVO> getqnalist(QnaVO vo);

	public List<FaqVO> getfaqlist(FaqVO vo);	

	int replyInsert (QnaVO vo);


	// 상건
	int insert(QnaVO vo);
	int qnaUpdate(QnaVO vo);
	int qnaDelete(int no);
	int qnaInsert(QnaVO vo);
	int updateGno(int no);

	int qnaCount(QnaVO vo);
	List<QnaVO> qnaList(QnaVO vo);
	QnaVO qnaDetail(int no);


	//notice
	int noticeInsert(NoticeVO vo);

	//상세페이지
	NoticeVO detail(int no);

	//faq
	int faqCount(FaqVO vo);
	List<FaqVO> faqList(FaqVO vo);

	//email
	int emailInsert (EmailVO vo);
	List<EmailVO> emailList (EmailVO vo);
	String emailSelect (int no);
	int memberSelect (String email);
	int count(EmailVO vo);
	int memberCount(MemberVO vo);
	List<MemberVO> memberList(MemberVO vo);

	//member
	MemberVO cmemberDetail(int no);
	int cmemberUpdate (MemberVO vo);

	int cmemberCount(MemberVO vo);
	List<MemberVO> cmemberList(MemberVO vo);
}