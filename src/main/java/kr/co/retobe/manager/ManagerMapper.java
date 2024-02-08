package kr.co.retobe.manager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.CqnaVO;

@Mapper
public interface ManagerMapper {

	//로그인
		AdminVO login(AdminVO vo);
		
		Map<String, Object> todayPayCnt(AdminVO avo);
		Map<String, Object> todayPayCancelCnt(AdminVO avo);
		Map<String, Object> thisMonthPayTotal(AdminVO avo);
		Map<String, Object> lastMonthPayTotal(AdminVO avo);
		Map<String, Object> lastMonthChargeTotal(AdminVO avo);
		Map<String, Object> thisYearPayTotal(AdminVO avo);
		List<Map<String, Object>> courseQna(AdminVO avo);

		int cqnaCount(Map<String, Object> map);
		List<CqnaVO> cqnaList(Map<String, Object> map);
		
		int courseCount(CourseVO vo);
		List<CourseVO> courseList(CourseVO vo);
}
