package kr.co.retobe.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@GetMapping("/user/userIndex.do")
	public String index(){//(HttpSession sess) {
		return "user/common/userIndex"; 
	}
}
