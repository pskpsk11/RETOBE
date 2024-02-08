package kr.co.retobe.manager;

import java.util.List;
import java.util.Map;

import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.CourseVO;

public interface ManagerService {

AdminVO login(AdminVO vo);
	
	Map<String, Object> todayPayCnt(AdminVO avo);
	Map<String, Object> todayPayCancelCnt(AdminVO avo);
	Map<String, Object> thisMonthPayTotal(AdminVO avo);
	Map<String, Object> lastMonthPayTotal(AdminVO avo);
	Map<String, Object> lastMonthChargeTotal(AdminVO avo);
	Map<String, Object> thisYearPayTotal(AdminVO avo);
	List<Map<String, Object>> courseQna(AdminVO avo);

	Map<String, Object> cqnaList(Map<String, Object> map);
	 Map<String, Object> courseListS(CourseVO vo);
}
