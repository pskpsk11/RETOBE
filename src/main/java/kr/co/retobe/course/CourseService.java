package kr.co.retobe.course;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.retobe.vo.CalendarVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.CqnaVO;
import kr.co.retobe.vo.ReviewVO;

@Service
public interface CourseService {
	List<CalendarVO> calendarList();
	
	List<CourseVO> getLectureList(CourseVO CVO);
	int cQnaInsert(CqnaVO vo);//, MultipartFile file, HttpServletRequest request);
	int cQnaUpdate(CqnaVO vo);//, MultipartFile file, HttpServletRequest request);
	int cQnaDelete(CqnaVO vo);//, HttpServletRequest request);
	CourseVO getSelectCourse(int no);
	Map<String, Object> getComplexSelect(CourseVO CVO);
	
	/*강좌 상세 문의*/
	List<CqnaVO> getCqnaDetailList(int course_no, int startIdx, int itemsPerPage);
    int getCqnaCount(int course_no);
	CourseVO getlectureDetail(int course_no);
//	List<ReviewVO> ReviewList(int course_no);
	
	/*강좌 상세 후기*/
	List<ReviewVO> getReviewList(int course_no, int startIdx, int itemsPerPage);
    int getreviewCount(int course_no);
    
    CqnaVO cqnaDetail(CqnaVO vo);
    
//    CqnaVO view(CqnaVO vo, boolean isUpdate);
    CqnaVO view(int cqna_no, boolean isUpdate);
    CqnaVO writeCqna(Map<String, Object> paramMap);
    
    CourseVO getCourseById(int course_no);

    

	CourseVO getInfoByCourse(int course_no, boolean isUpdate);

	
	CourseVO getcourseDetail(int course_no);
}
