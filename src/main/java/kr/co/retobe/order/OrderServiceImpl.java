package kr.co.retobe.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.PayDetailVO;
import kr.co.retobe.vo.PayVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper mapper;
	
	@Override //관리자pay
	public Map getlistgm(Map param) {	
		int count = mapper.payCount(param); //총개수
        int totalPage = count / 10; //총 페이지
        if (count % 10 > 0) totalPage++;
        System.out.println(param.get("page"));
        System.out.println(param.get("StartIdx"));
        List<Map> list = mapper.getlistgm(param); //목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        //페이징
        int endPage = (int)(Math.ceil(Integer.parseInt((String)param.get("page"))/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean prev = startPage > 1;
        boolean next = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("prev", prev);
        map.put("next", next);
		return map;
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
	public CourseVO getlecture(int course_no) {
		return mapper.lecture(course_no);
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
