package kr.co.retobe.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
	List<Map> getlistgm();
	List<Map> getlistm();
	
	List<Map<String, Object>> payList(Map<String, Object> map);
	List<Map<String, Object>> conEduTotal(Map<String, Object> map);
	Map<String, Object> pay_chargeTotal(Map<String, Object> map);
}


