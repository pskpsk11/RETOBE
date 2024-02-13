package kr.co.retobe.board;

import java.util.List;
import java.util.Map;

import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;
import kr.co.retobe.vo.ReviewVO;

public interface BoardService {
	int insertReview (ReviewVO rvo);
	double selectCourseRating(int no);
	int updateCourseRating(String no, String rating);
	List<Map<String, Object>> getSelectReviewNo();
	ReviewVO getReviewDetail(int review_no);
	
	int updateReview(ReviewVO vo);
	
	//qna
	Map<String, Object> qnaList(QnaVO vo);
	
	int qnaInsert(QnaVO vo);//, MultipartFile file, HttpServletRequest request);
	int qnaUpdate(QnaVO vo);//, MultipartFile file, HttpServletRequest request);
	int qnaDelete(QnaVO vo);//, HttpServletRequest request);
	QnaVO qnaDetail(QnaVO vo);
	//notice
	Map<String, Object> noticeList(NoticeVO vo);
	
	int noticeInsert (NoticeVO vo);
	NoticeVO noticeDetail(NoticeVO vo);
	
	//faq
	Map<String, Object> faqList(FaqVO vo);
	
	
	QnaVO view(QnaVO vo, boolean isUpdate);
}
