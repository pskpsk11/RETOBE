package kr.co.retobe.gmanager;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.QnaVO;

public class GmanagerController {

	@Autowired
	GmanagerService service;
	
	@GetMapping ("/chiefAdmin/chiefIndex.do")
	public String index(HttpSession sess, Model model,QnaVO qvo) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo"); 
		model.addAttribute("totalCount", service.totalCount());
		model.addAttribute("q", service.qna(qvo));
		return "chiefAdmin/common/chiefIndex";
	}
	
	@GetMapping ("/chiefAdmin/chiefSalesIndex.do")
	public String chiefSalesIndex(Model model) {
//		model.addAttribute("pay_chargeTotal", service.pay_chargeTotal());
		return "chiefAdmin/sales/chiefSalesIndex";
	}
}
