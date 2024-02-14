package kr.co.retobe.order;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.retobe.vo.AdminVO;

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
}
