package kr.co.retobe.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper mapper;
	
	@Override
	public List<Map> getlistgm() {	
		return mapper.getlistgm();
	}
	@Override
	public List<Map> getlistm() {	
		return mapper.getlistm();
	}
	
	//sales
	@Override
	public List<Map<String, Object>> payList(Map<String, Object> map) {
		return mapper.payList(map);
	}
	
	@Override
	public List<Map<String, Object>> conEduTotal(Map<String, Object> map) {
		return mapper.conEduTotal(map);
	}
	
	@Override
	public Map<String, Object> pay_chargeTotal(Map<String, Object> map) {
		return mapper.pay_chargeTotal(map);
	};
}
