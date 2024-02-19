package kr.co.retobe.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.PayDetailVO;
import kr.co.retobe.vo.PayVO;

public interface OrderService {
	Map getlistgm(Map param);
	List<Map> getlistm();
	
	List<Map<String, Object>> payList(Map<String, Object> map);
	List<Map<String, Object>> conEduTotal(Map<String, Object> map);
	Map<String, Object> pay_chargeTotal(Map<String, Object> map);
	
	Map<String, Object> payDetailIndex(int detail_no);
	boolean payCancel(Map<String, Object> cancelReasonMap);
	Map<String, Object> payCancelDetailIndex(int detail_no);
	List<BasketVO> getcart(String cartNo);
	Map<String, Object> CartMap(int cart_no);
	boolean pay(PayVO vo, MultipartFile file, HttpServletRequest request);
	boolean payDetail(PayDetailVO vo, MultipartFile file, HttpServletRequest request);
	
	List<Map<String, Object>> getorder(Map map);
}
