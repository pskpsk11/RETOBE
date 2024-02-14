package kr.co.retobe.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.CqnaVO;

@Controller
public class ManagerController {
//<<<<<<< HEAD

	@Autowired
	ManagerService service;
	
	@GetMapping("/manager/main.do")
	public String adIndex(HttpSession sess, Model model) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
		
		model.addAttribute("admin", admin);
		model.addAttribute("tpc", service.todayPayCnt(admin));
		model.addAttribute("tpcc", service.todayPayCancelCnt(admin));
		model.addAttribute("tmpt", service.thisMonthPayTotal(admin));
		model.addAttribute("lmpt", service.lastMonthPayTotal(admin));
		model.addAttribute("lmct", service.lastMonthChargeTotal(admin));
		model.addAttribute("typt", service.thisYearPayTotal(admin));
		model.addAttribute("cq", service.courseQna(admin));
		
		
		
		return "admin/common/adIndex";
		
	}
	
	//login
		@GetMapping("/manager/login.do")
		public String adLogin() {
			return "admin/common/adLogin";
		}
		
		@PostMapping("/manager/login.do")
		public String loginProcess(AdminVO vo, HttpSession sess, Model model) {
			AdminVO login = service.login(vo);
			if (login == null) { // 로그인실패
				model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
				model.addAttribute("cmd", "back");
				return "admin/common/adAlert";
			} else if(login.getAd_type()== 999){ // 총관리자로 로그인
				sess.setAttribute("adLoginInfo", login);
				System.out.println(999);
				return "redirect:/gmanager/main.do";
			} else if((login.getAd_type() == 1) || (login.getAd_type() == 2) || (login.getAd_type() == 3)){ // 학원관리자로 로그인
				sess.setAttribute("adLoginInfo", login);
				return "redirect:/manager/main.do";
			} else {
				System.out.println("튕김");
				return "redirect:/user/main.do";
			}
		}

		
		@GetMapping("/manager/logout.do")
		public String logout(Model model, HttpSession sess) {
			sess.invalidate();
			model.addAttribute("msg", "로그아웃되었습니다.");
			model.addAttribute("url", "/tobe/manager/login.do");
			model.addAttribute("cmd", "move");
			return "admin/common/adAlert";
		}
		
		@GetMapping("/manager/course.do")
		public String adCourseIndex(HttpSession sess, Model model, CourseVO vo) {
			AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
			model.addAttribute("admin", admin);
			vo.setAdmin_no(admin.getAdmin_no());
			model.addAttribute("map", service.courseListS(vo));
			
			//강좌 리스트 
			return "admin/course/adCourseIndex"; 
		}	

		@GetMapping("/manager/qna.do")
		public String adQnaIndex(HttpSession sess, Model model, CqnaVO cqvo) {
			AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
			Map<String, Object> map = new HashMap<>();
			map.put("cqvo", cqvo);
			map.put("no", admin.getAdmin_no());
			map.put("page", cqvo.getPage());
			map.put("startIdx", cqvo.getStartIdx());
			
			model.addAttribute("map", service.cqnaList(map));
			
			model.addAttribute("admin", admin);
			return "admin/customer/adQnaIndex"; 
		}
		
		@GetMapping("/manager/courseForm.do") 
		public String adCourseForm(HttpSession sess, Model model) {
			AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
			model.addAttribute("admin", admin);
			return "admin/course/adCourseForm"; 
		}
		@GetMapping("/manager/courseMod.do") 
		public String adCourseModForm(HttpSession sess, Model model) {
			AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
			model.addAttribute("admin", admin);
			return "admin/course/adCourseModForm"; 
		}
//=======
//	
//>>>>>>> branch 'master' of https://github.com/pskpsk11/RETOBE.git
}
