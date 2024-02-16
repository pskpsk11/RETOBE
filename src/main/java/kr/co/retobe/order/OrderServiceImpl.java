package kr.co.retobe.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.PayDetailVO;
import kr.co.retobe.vo.PayVO;

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
	
	@Override
	public Map<String, Object> payDetailIndex(int detail_no) {
		return mapper.payDetailIndex(detail_no);
	}
	
	@Override
	public boolean payCancel(Map<String, Object> cancelReasonMap) {
		if( mapper.payCancel(cancelReasonMap)> 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Map<String, Object> payCancelDetailIndex(int detail_no) {
		return mapper.payCancelDetailIndex(detail_no);
	}
	
	public List<BasketVO> getcart(String cartNo) {
		return mapper.getCart(cartNo);
	}
	
	@Override
	public Map<String, Object> CartMap(int cart_no) {
		return mapper.CartMap(cart_no);
	}


	@Override
	public boolean pay(PayVO vo, MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean payDetail(PayDetailVO vo, MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public List<Map<String, Object>> getorder(Map map) {
		return mapper.getorder(map);
	}
}
