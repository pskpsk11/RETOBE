package kr.co.retobe.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.PayDetailVO;
import kr.co.retobe.vo.PayVO;

@Controller
public class OrderController {
	@Autowired
	OrderService service;
	
	@GetMapping("/manager/pay.do")
	public String adPayIndex(HttpSession sess, Model model) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
		if(admin == null) {
			return "redirect:/manager/login.do";
		}
		model.addAttribute("admin", admin);
		model.addAttribute("list", service.getlistm());
		return "admin/pay/adPayIndex"; 
	}
	
	@GetMapping ("/gmanager/pay.do")
	public String chiefPayindex(HttpSession sess, Model model) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
		if(admin == null) {
			return "redirect:/manager/login.do";
		}
		model.addAttribute("admin", admin);
		model.addAttribute("list", service.getlistgm());
	return "chiefAdmin/pay/chiefPayIndex";
	}
	
	@GetMapping("/gmanager/payList.do")
	public String payList(@RequestParam Map<String, Object> condition, Model model) {
		model.addAttribute("payList", service.payList(condition));
		model.addAttribute("conEduTotal", service.conEduTotal(condition));
		model.addAttribute("condition", condition);
		model.addAttribute("pay_chargeTotal", service.pay_chargeTotal(condition));
		return "chiefAdmin/sales/chiefSalesIndex";
	}
	
	@GetMapping("/user/payCompleteDetail.do")
	public String userPayCompleteDetail(@RequestParam("detail_no") int detail_no, Model model) {
		
		model.addAttribute("pdvo", service.payDetailIndex(detail_no));
		return "user/pay/userPayCompleteDetail";
	}
	
	@GetMapping("/user/payCancelForm.do")
	public String userPayCancelForm(@RequestParam("detail_no") int detail_no, Model model) {
		model.addAttribute("pdvo", service.payDetailIndex(detail_no));
		return "user/pay/userPayCancelForm";
	}
	
	@PostMapping("/user/payCancel.do")
	public String userPayCancel(@RequestParam("detail_no") int detail_no,
								@RequestParam("pay_cancel_reason") String pay_cancel_reason,
								@RequestParam("pay_cancel_reason_detail") String pay_cancel_reason_detail,
								Model model) {
		int order_no = (int)service.payDetailIndex(detail_no).get("order_no");
		Map<String, Object> cancelReasonMap = new HashMap<>();
		cancelReasonMap.put("order_no", order_no);
		cancelReasonMap.put("pay_cancel_reason", pay_cancel_reason);
		cancelReasonMap.put("pay_cancel_reason_detail", pay_cancel_reason_detail);
		boolean r = service.payCancel(cancelReasonMap);
		
		if(r) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "결제가 취소되었습니다.");
			model.addAttribute("url", "/tobe/user/payCancelDetail.do?detail_no="+detail_no);
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "결제 취소가 실행되지 않았습니다.");
		}
		return "user/common/userAlert";
	}
	
	@GetMapping("/user/payCancelDetail.do")
	public String userPayCancelDetail(@RequestParam("detail_no") int detail_no, Model model) {
		model.addAttribute("pcdi", service.payCancelDetailIndex(detail_no));
		return "user/pay/userPayCancelDetail";
	}
	
	@GetMapping ("/user/payDetail.do")
	public String userPayDetail(Model model, String cartNo, MemberVO mvo, PayVO pvo, PayDetailVO pdvo) {
//		System.out.println(cartNo[0]+" 카트다~~~~~~~~~~~`"+cartNo[1]);
		List<BasketVO> basket = service.getcart(cartNo);
		model.addAttribute("cartNo", cartNo);
		model.addAttribute("basket", basket);
		System.out.println(basket);
		return "user/pay/userPayDetail";
	}
	
	//고칠부분
	@GetMapping ("/user/mainPayDetail.do")
	public String userMainPayDetail(Model model, MemberVO mvo, PayVO pvo, PayDetailVO pdvo) {
		model.addAttribute("lecture");
//		System.out.println(cartNo[0]+" 카트다~~~~~~~~~~~`"+cartNo[1]);
		return "user/pay/userMainPayDetail";
	}
	
	@PostMapping ("/user/payCompleteDetail.do")
	public String pay(PayVO vo, Model model, HttpServletRequest request) {
//		boolean pay = service.pay(vo, file, request);
		System.out.println(vo.getMember_no());
		System.out.println(vo.getPoint_usage());
		System.out.println(request.getParameter("cartNo"));
		
		Map map = new HashMap();
		map.put("cart_no", request.getParameter("cartNo"));
		map.put("member_no", vo.getMember_no());
		
		List<Map<String, Object>> result = service.getorder(map);
		for (Map<String, Object> m : result) {
			System.out.println(m.get("product_no")+":"+m.get("i_price"));
		}
		
		return null;
	}
}
