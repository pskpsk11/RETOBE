package kr.co.retobe.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;
import kr.co.retobe.vo.ReviewVO;

@Mapper
public interface BoardMapper {
	int insert (ReviewVO rvo);
	double selectCourse (int no);
	int updateCouse(@Param("rating") String userId, @Param("no") String ownerId);
	//review
	List<ReviewVO> selectReviewNo(ReviewVO rvo);
	ReviewVO ReviewDetail(int review_no);
	int updateReview(ReviewVO vo);
	int reviewCount(ReviewVO vo);
	
	//qna
	int insert(QnaVO vo);
	int qnaUpdate(QnaVO vo);
	int qnaDelete(int qna_no);
	int qnaInsert(QnaVO vo);
	//int updateGno(int no);
	
	int qnaCount(QnaVO vo);
	List<QnaVO> qnaList(QnaVO vo);
	QnaVO qnaDetail(int no);
	
	//문의 조회수
	int updateQviewcnt(int qna_no);
	//문의 답변형
	int updateQgno(int qna_no);
	int updateQono(QnaVO vo);
	int reply(QnaVO vo);
	
	
	
	//notice
	int noticeInsert(NoticeVO vo);
	int noticeCount(NoticeVO vo);
	List<NoticeVO> noticeList(NoticeVO vo);
	//상세페이지
	NoticeVO detail(int no);
	
	int updateViewcnt(int notice_no);
	
	//faq
	int faqCount(FaqVO vo);
	List<FaqVO> faqList(FaqVO vo);
	
	QnaVO view(QnaVO qna_no);
}
