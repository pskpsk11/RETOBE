package kr.co.retobe.gmanager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.QnaVO;

@Mapper
public interface GmanagerMapper {
	Map<String, Object> pay_chargeTotal();
	
	int totalCount();
	
	List<Map<String, Object>> qna(QnaVO qvo);
}
