package kr.co.retobe.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.retobe.vo.CalendarVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.CqnaVO;
import kr.co.retobe.vo.ReviewVO;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseMapper mapper;
	
	@Override
	public List<CalendarVO> calendarList() {
		return mapper.calendarList();
	}
	
	public List<CourseVO> getLectureList(CourseVO CVO) {
		return mapper.lectureSelect(CVO);
	}

	@Override
	public int cQnaInsert(CqnaVO vo) {
		int r = mapper.qnaInsert(vo);
		if (r > 0) mapper.updateGno(vo.getCqna_no());
		return r;
	}

	@Override
	public int cQnaUpdate(CqnaVO vo) {
		int r = mapper.qnaUpdate(vo);
		return r;
	}

	@Override
	public int cQnaDelete(CqnaVO vo) {
		return mapper.qnaDelete(vo.getCqna_no());
	}

	@Override
	public CourseVO getSelectCourse(int no) {
		return mapper.courseSelect(no);
	}
	
//	@Override
//	public List<CourseVO> getComplexSelect(CourseVO CVO) {
//		return mapper.complexSelect(CVO);
//	}
	
	@Override
	public Map<String, Object> getComplexSelect(CourseVO param) {
		int count = mapper.complexCount(param); //총개수
        int totalPage = count / 10; //총 페이지
        if (count % 10 > 0) totalPage++;
        System.out.println(param.getPage());
        System.out.println(param.getStartIdx());
        List<CourseVO> list = mapper.complexSelect(param); //목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        //페이징
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean prev = startPage > 1;
        boolean next = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("prev", prev);
        map.put("next", next);
		return map;
	}
	
	@Override
    public List<CqnaVO> getCqnaDetailList(int course_no, int startIdx, int itemsPerPage) {
        Map<String, Object> params = new HashMap<>();
        params.put("course_no", course_no);
        params.put("startIdx", startIdx);
        params.put("itemsPerPage", itemsPerPage);
        return mapper.cqnaDetailList(params);
    }

    @Override
    public int getCqnaCount(int course_no) {
        Map<String, Object> params = new HashMap<>();
        params.put("course_no", course_no);
        return mapper.cqnaCount(params);
    }
	
	@Override
	public CourseVO getlectureDetail(int course_no) {
		return mapper.lectureDetail(course_no);
	}
	
//	@Override
//	public List<ReviewVO> ReviewList(int course_no){
//		System.out.println("반갑다.");
//		return mapper.ReviewList(course_no);
//	}
	
	@Override
    public List<ReviewVO> getReviewList(int course_no, int startIdx, int itemsPerPage) {
        Map<String, Object> params = new HashMap<>();
        params.put("course_no", course_no);
        params.put("startIdx", startIdx);
        params.put("itemsPerPage", itemsPerPage);
        return mapper.ReviewList(params);
    }

    @Override
    public int getreviewCount(int course_no) {
        Map<String, Object> params = new HashMap<>();
        params.put("course_no", course_no);
        return mapper.cqnaCount(params);
    }
    
    @Override
	public CqnaVO cqnaDetail(CqnaVO vo) {
		CqnaVO data = mapper.cqnaDetail(vo.getCqna_no());
		// TODO Auto-generated method stub
		return data;
	}
    
//    @Override
//    public CqnaVO view(CqnaVO vo, boolean isUpdate) {
//        // isUpdate가 true이면 업데이트 시 필요한 로직 추가
//        return mapper.view(vo);
//    }
	
    @Override
    public CqnaVO view(int cqna_no, boolean isUpdate) {
        return mapper.view(cqna_no);
    }
    
//    @Override
//    public List<CqnaVO> writeCqna(Map<String, Object> paramMap) {
//        return mapper.writeCqna(paramMap);
//    }
    
	@Override
	public CqnaVO writeCqna(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
    public CourseVO getInfoByCourse(int course_no, boolean isUpdate) {
        return mapper.selectInfoByCourse(course_no);
    }

	@Override
	public CourseVO getcourseDetail(int course_no) {
		return mapper.courseDetail(course_no);
	}

	@Override
	public CourseVO getCourseById(int course_no) {
		// TODO Auto-generated method stub
		return null;
	}
}
