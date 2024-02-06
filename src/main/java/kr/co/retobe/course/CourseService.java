package kr.co.retobe.course;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.retobe.vo.CalendarVO;

@Service
public interface CourseService {
	List<CalendarVO> calendarList();
}
