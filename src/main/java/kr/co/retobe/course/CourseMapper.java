package kr.co.retobe.course;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.CalendarVO;

@Mapper
public interface CourseMapper {

	List<CalendarVO> calendarList();
}
