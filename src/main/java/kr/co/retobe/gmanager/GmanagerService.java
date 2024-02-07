package kr.co.retobe.gmanager;

import java.util.List;
import java.util.Map;

import kr.co.retobe.vo.QnaVO;

public interface GmanagerService {
	Map<String, Object> pay_chargeTotal();
	
	int totalCount();
	
	List<Map<String, Object>> qna(QnaVO qvo);
}
