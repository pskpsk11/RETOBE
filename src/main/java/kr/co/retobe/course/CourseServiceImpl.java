package kr.co.retobe.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.retobe.vo.CalendarVO;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseMapper mapper;
	
	@Override
	public List<CalendarVO> calendarList() {
		return mapper.calendarList();
	}
}
