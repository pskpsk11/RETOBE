package kr.co.retobe.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.retobe.vo.BasketVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.MemberVO;

@Controller
public class UserController {
	@Autowired
	UserService service;
	//메인페이지
	@GetMapping("/user/main.do")
	public String index(){//(HttpSession sess) {
		return "user/common/userIndex"; 
	}
	
	//로그인
	@GetMapping("/user/login.do")
	public String userLogin() {
		return "user/member/userLogin";
	}
	
	//회원가입
	@GetMapping("/user/joinForm.do")
	public String userJoinForm() {
		return "user/member/userJoinForm";
	}
	
	@PostMapping("/user/join.do")
	public String regist(MemberVO vo, Model model) {
		boolean r = service.regist(vo); 
		if (r) { 
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "회원가입되었습니다.");
			model.addAttribute("url", "/tobe/user/main.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "회원가입실패");
		}
		return "user/common/userAlert";
	}
	
	@PostMapping("/user/login.do")
	public String loginProcess(MemberVO vo, HttpSession sess, Model model) {
		MemberVO login = service.login(vo);
		if (login == null) { // 로그인실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "user/common/userAlert";
		} else { // 로그인성공
			sess.setAttribute("loginInfo", login);
			return "redirect:/user/main.do";
		}
	}
	@GetMapping("/user/logout.do")
	public String logout(Model model, HttpSession sess) {
//		sess.removeAttribute("loginInfo");
		sess.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/tobe/user/main.do");
		model.addAttribute("cmd", "move");
		return "user/common/userAlert";
	}
	
	@PostMapping("/user/modifyForm.do")
	public String userModifyForm(HttpSession sess, MemberVO mvo, Model model) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");
		MemberVO pwdCheck = service.pwdCheck(mvo);
		if(user == null) {
			return "redirect:/user/main.do";
		}
		
		if (pwdCheck == null) { // 비밀번호 확인 실패
			model.addAttribute("msg", "비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "user/common/userAlert";
		} else { // 비밀번호확인 성공
			model.addAttribute("user", user);
			return "user/member/userModifyForm";
		}
	}
	
	@PostMapping("/user/cancelForm.do")
	public String quitForm(HttpSession sess, MemberVO mvo, Model model) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");
		MemberVO pwdCheck = service.pwdCheck(mvo);
		if(user == null) {
			return "redirect:/user/main.do";
		}
		
		if (pwdCheck == null) { // 비밀번호 확인 실패
			model.addAttribute("msg", "비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "user/common/userAlert";
		} else { // 비밀번호확인 성공
			model.addAttribute("user", user);
			return "user/member/userQuitForm";
		}
	}

	@PostMapping("/user/modify.do")
	public String userModify(MemberVO vo, Model model) {
		int r = service.update(vo);
		String msg = "";
		String url = "modify.do";
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","move");
		return "user/common/userAlert";
	}
	
	@PostMapping("/user/cancel.do")
	public String quit(MemberVO mvo, Model model, HttpSession sess) {
		mvo = (MemberVO)sess.getAttribute("loginInfo");
		System.out.println(mvo.getMember_no());
		int r = service.quit(mvo);
		String msg = "";
		String url = "/tobe/user/main.do";
		if (r > 0) {
			sess.invalidate();
			msg = "회원탈퇴가 완료되었습니다.";
		} else {
			msg = "실행 오류. 회원탈퇴가 정상적으로 이루어지지 않았습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","move");
		return "user/common/userAlert";
	}
	
	//약관동의
	@GetMapping("/user/joinPolicy.do")
	public String userJoinPolicy() {
		return "user/member/userJoinPolicy";
	}
	
	//아이디 중복확인
	@ResponseBody
	@GetMapping("/user/idCheck.do")
	public String idCheck(@RequestParam String id) {
		boolean r = service.dupId (id);
		return String.valueOf(r);
	}	
	
	@GetMapping("/user/mypage.do")
	public String userMyPageMain(HttpSession sess, Model model) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");
		
		model.addAttribute("user", user); // 사용자 정보 넘기기
		model.addAttribute("cci", service.currentCourseIndex(user)); // 현재수강중인강의에 들어갈 정보
		model.addAttribute("pci", service.pastCourseIndex(user)); // 수강신청내역에 들어갈 정보
		model.addAttribute("mcai", service.myCourseAskIndex(user)); // 나의문의에 들어갈 정보
		model.addAttribute("ai", service.askIndex(user)); // 나의문의에 들어갈 정보
		model.addAttribute("mri", service.myReviewIndex(user)); // 나의후기에 들어갈 정보
		
		// db에는 문자열로 있는 날짜들을 Date 타입으로 바꾸는 것
		return "user/member/userMyPageMain";
	}
	
	@GetMapping("/user/userBasket.do")
	public String userBasket(Model model, HttpServletRequest request, BasketVO vo) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("loginInfo");
		//int no = course_no;
		if(vo.getCourse_no() > 0) {
			vo.setMember_no(login.getMember_no());
			service.basketInsert(vo);
		}
		model.addAttribute("cart", service.cartList(login.getMember_no()) );
		//model.addAttribute("cart", service.cartList(4));
		//test
		return "user/common/userBasket";
	}
	
	//장바구니 삭제
	@GetMapping("/user/userBasketDelete.do")
	public String delete(Model model, int[] cartNo) {
		int r = 0;
		
		for(int i=0; i<cartNo.length; i++) {
			//System.out.println(cartNo[0]+"입니다!!!!!!!!!!!");
			r = service.cartDelete(cartNo[i]);
			if(r < 1) {
				model.addAttribute("cmd", "back");
				model.addAttribute("msg", "등록 오류");
				return "user/common/userAlert";
			}
		}
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "userBasket.do");
		return "user/common/userAlert";
	}
	
	@GetMapping("/user/userCompareCourse.do")
	public String userCompareCourse() {
		return "user/common/userCompareCourse";
	}
	
	@GetMapping("/user/modify.do")
	public String userModify(HttpSession sess, Model model) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");
		model.addAttribute("user", user);
		return "user/member/userModify";
	}
	
	@GetMapping("/user/cancel.do")
	public String quit(HttpSession sess, Model model) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");
		model.addAttribute("user", user);
		return "user/member/userQuit";
	}
	
	@GetMapping("/user/modal.do")
	public String modal (HttpSession sess, Model model) {
		 CourseVO Comp1 = (CourseVO)sess.getAttribute("CourseComp1");
		 CourseVO Comp2 = (CourseVO)sess.getAttribute("CourseComp2");
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		  if(Comp1 != null){
			  map.put("cosComp1", service.compList(Comp1.getCourse_no()));
			  map.put("cosCompRe1", service.compTotalReview(Comp1.getCourse_no()));
		  }	
		  if(Comp2 != null) {
			  map.put("cosComp2", service.compList(Comp2.getCourse_no()));
			  map.put("cosCompRe2", service.compTotalReview(Comp2.getCourse_no()));
		  } 
		  model.addAttribute("map", map);
		  
		return "user/common/courseModal"; 
	}
	
	@GetMapping("/user/modalRemove.do")
	public String modalRemove (HttpSession sess, Model model, String remove) {
		String r = remove;
		if(r.equals("cosComp1")){//   r == "cosComp1") {
			System.out.println("첫번쨰");
			if(sess.getAttribute("CourseComp2") != null) { //세션 2가 있으면 세선2 -> 세션 1로 변경
				sess.setAttribute("CourseComp1", sess.getAttribute("CourseComp2"));
				sess.removeAttribute("CourseComp2");
			}else {
				sess.removeAttribute("CourseComp1");
			}
		} else if(r.equals("cosComp2")){
			sess.removeAttribute("CourseComp2");
			
		}
		System.out.println("세션1"+ sess.getAttribute("CourseComp1") +"세션2:"+sess.getAttribute("CourseComp2")+"!!!!!!");
		 CourseVO Comp1 = (CourseVO)sess.getAttribute("CourseComp1");
		 CourseVO Comp2 = (CourseVO)sess.getAttribute("CourseComp2");

		 Map<String, Object> map = new HashMap<String, Object>();
		 
		  if(Comp1 != null){
			  map.put("cosComp1", service.compList(Comp1.getCourse_no()));
			  map.put("cosCompRe1", service.compTotalReview(Comp1.getCourse_no()));
		  }	
		  if(Comp2 != null) {
			  map.put("cosComp2", service.compList(Comp2.getCourse_no()));
			  map.put("cosCompRe2", service.compTotalReview(Comp2.getCourse_no()));
		  } 
		  model.addAttribute("map", map);
		return "user/common/courseModal"; 
	}
}
