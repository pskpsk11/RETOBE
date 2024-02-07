package kr.co.retobe.gmanager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.retobe.vo.QnaVO;

@Service
public class GmanagerServiceImpl implements GmanagerService{

	@Autowired
	GmanagerMapper mapper;
	
	@Override
	public Map<String, Object> pay_chargeTotal() {
		return mapper.pay_chargeTotal();
	};
	
	@Override 
	public List<Map<String, Object>> qna(QnaVO qvo) {
		return mapper.qna(qvo);
	}

	@Override
	public int totalCount() {
		return mapper.totalCount();
	}
}
