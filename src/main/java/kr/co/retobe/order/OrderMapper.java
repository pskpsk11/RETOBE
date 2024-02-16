package kr.co.retobe.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.PayDetailVO;
import kr.co.retobe.vo.PayVO;

@Mapper
public interface OrderMapper {
	List<Map> getlistgm();
	List<Map> getlistm();
	
	List<Map<String, Object>> payList(Map<String, Object> map);
	List<Map<String, Object>> conEduTotal(Map<String, Object> map);
	Map<String, Object> pay_chargeTotal(Map<String, Object> map);
	
	Map<String, Object> payDetailIndex(int detail_no);
	int payCancel(Map<String, Object> cancelReasonMap);
	Map<String, Object> payCancelDetailIndex(int detail_no);

	List<Map> list(int no);	//목록 가져올 것 	
	int count (int no);
	
	List<BasketVO> getCart(String cartNo);
	Map<String, Object> CartMap(int cart_no);
	
	int pay(PayVO vo);
	int payDetail(PayDetailVO vo);
	
	List<Map<String, Object>> getorder(Map map);
}


