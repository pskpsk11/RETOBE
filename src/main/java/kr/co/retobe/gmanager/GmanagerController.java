package kr.co.retobe.gmanager;

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
import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.util.SendMail;
import kr.co.retobe.vo.AdminVO;
import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.EmailVO;
import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;

@Controller
public class GmanagerController {

	@Autowired
	GmanagerService service;
	//common
	@GetMapping ("/gmanager/main.do")
	public String index(HttpSession sess, Model model,QnaVO qvo) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo"); 
		model.addAttribute("totalCount", service.totalCount());
		model.addAttribute("q", service.qna(qvo));
		return "chiefAdmin/common/chiefIndex";
	}

	@GetMapping ("/gmanager/sales.do")
	public String chiefSalesIndex(Model model) {
//		model.addAttribute("pay_chargeTotal", service.pay_chargeTotal());
		return "chiefAdmin/sales/chiefSalesIndex";
	}
	//cousre
	@GetMapping ("/gmanager/courseForm.do")
	public String chiefClassForm() {
		return "chiefAdmin/course/chiefCourseForm";
	}

	@PostMapping ("/gmanager/courseAdd.do")
	public String insert(CourseVO vo, Model model, MultipartFile file, HttpServletRequest request, String educationName) {
		System.out.println(vo);
		boolean r = service.courseinsert(vo, file, request);
	      if (r) { // 정상적으로 DB에 insert 
	          model.addAttribute("cmd", "back");         
	          model.addAttribute("msg", "수업등록이 완료되었습니다.");
	          if(educationName != null) {
	        	  model.addAttribute("cmd", "back");         
		          model.addAttribute("msg", "수업등록이 완료되었습니다.");
	          }
	       } else { // 등록안됨
	          model.addAttribute("cmd", "back");
	          model.addAttribute("msg", "수업등록에 실패하였습니다.");    
	       }
		return "chiefAdmin/common/alert";
	}

	@GetMapping ("/gmanager/courseMod.do")
	public String modcourse(Model model, int no) {

		model.addAttribute("map", service.modcourse(no));
		return "chiefAdmin/course/chiefModCourseForm"; 
	}

	@PostMapping ("/gmanager/course.do")
	public String cheifModForm(CourseVO vo, Model model) {
		int r = service.update(vo);
		String msg="";
		String url="course.do";
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정사항이 없습니다";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","move");
		return "chiefAdmin/common/alert";
	}

	//
	@GetMapping ("/gmanager/course.do")
	public String chiefCourseIndex(HttpSession sess, Model model, CourseVO vo) {
		AdminVO admin = (AdminVO)sess.getAttribute("adLoginInfo");
		model.addAttribute("admin", admin);
		vo.setAdmin_no(admin.getAdmin_no());
		model.addAttribute("map", service.courseListS(vo));

		//강좌 리스트 
		return "chiefAdmin/course/chiefCourseIndex";
	}
	//customer
	@GetMapping ("/gmanager/customer.do")
	public String index(Model model, NoticeVO vo) {
		Map<String, Object> NoticeList = service.noticeList(vo);
		model.addAttribute("map", NoticeList);
	return "chiefAdmin/customer/chiefCustomerIndex";
	}

	@GetMapping ("/gmanager/noticeDetail.do")
	public String Detail(Model model, @RequestParam("noticeNo") int noticeNo) {
		NoticeVO notice = service.getNoticeDetail(noticeNo);
	        model.addAttribute("notice", notice);
	return "chiefAdmin/customer/chiefNoticeDetail";
	}

	@GetMapping ("/gmanager/noticeForm.do")
	public String Notice() {
	return "chiefAdmin/customer/chiefNoticeForm";
	}

	@GetMapping ("/gmanager/qnaList.do")
		public String getQnaListReal(Model model, QnaVO vo) {
		Map<String, Object> QnaList = service.getQnaListReal(vo);
		model.addAttribute("map", QnaList);
		return "chiefAdmin/customer/chiefQnaList";
	}
	@GetMapping ("/gmanager/qnaDetail.do")
	public String QnaDtail(Model model, @RequestParam("qna_no") int qnaNo) {
		QnaVO qna = service.getQnaDetail(qnaNo);
		model.addAttribute("qna", qna);
		return "chiefAdmin/customer/chiefQnaDetail";
	}

	@PostMapping ("/gmanager/noticeAdd.do")
	public String insert(NoticeVO vo, Model model) {
		boolean r = service.customerinsert(vo);
	      if (r) { // 정상적으로 DB에 insert 
	          model.addAttribute("cmd", "move");         
	          model.addAttribute("msg", "공지사항 등록이 완료되었습니다.");
	          model.addAttribute("url", "/tobe/gmanager/customer.do");
	       } else { // 등록안됨
	          model.addAttribute("cmd", "back");
	          model.addAttribute("msg", "공지사항 등록에 실패하였습니다.");    
	       }
		return "chiefAdmin/common/alert";
	}

	@GetMapping ("/gmanager/replyForm.do")
	public String chiefReply() {
	return "chiefAdmin/customer/chiefReplyForm";
	}

	@GetMapping ("/gmanager/faqList.do")
	public String FaqList(Model model, FaqVO vo) {	
		List<FaqVO> FaqList = service.getfaqlist(vo);
		model.addAttribute("list", FaqList);
	return "chiefAdmin/customer/chiefFaqList";
	}

	@GetMapping ("/gmanager/faqForm.do")
	public String FaqForm() {
	return "chiefAdmin/customer/chiefFaqForm";
	}

	@PostMapping ("/gmanager/faqAdd.do")
	public String insert(FaqVO vo, Model model) {
		boolean r = service.faqinsert(vo);
	      if (r) { // 정상적으로 DB에 insert 
	          model.addAttribute("cmd", "move");         
	          model.addAttribute("msg", "FAQ 등록이 완료되었습니다.");
	          model.addAttribute("url", "/tobe/gmanager/customer/chiefFaqForm.do");
	       } else { // 등록안됨
	          model.addAttribute("cmd", "back");
	          model.addAttribute("msg", "FAQ 등록에 실패하였습니다.");    
	       }
		return "chiefAdmin/common/alert";
	}

	@PostMapping("/gmanager/reply.do")
	public String insert(Model model, QnaVO vo ) {
		System.out.println("등러왔다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		int r = service.QnaReply(vo);//, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/tobe/gmanager/qnaList.do"); //돌아갈 페이지 박모훈 완성 후 ..
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "chiefAdmin/common/alert";
	}

	@PostMapping("/gmanager/edit.do")
	public String edit(Model model, QnaVO vo ) {
		System.out.println("등러왔다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		int r = service.QnaReply(vo);//, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/tobe/gmanager/qnaList.do"); //돌아갈 페이지 박모훈 완성 후 ..
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "chiefAdmin/common/alert";
	}
	//email
	@Autowired
	SendMail sendEmail;

	@GetMapping("/gmanager/emailForm.do")
	public String emailWrite(int[] member_no, Model model) {
		String email="";
		System.out.println(member_no + "member_no");
		if(member_no == null) {
			model.addAttribute("email", null);
		}else {
			for(int i=0; i<member_no.length;i++) {
				email +=service.memberEmail(member_no[i]); //회원 emai주소 가져오기 
				if((member_no.length -1) != i) {
					email += ", "; //회원 emai주소 가져오기 
				}

			}
			model.addAttribute("email", email);
		}

		return "chiefAdmin/email/chiefEmailForm"; 
	}

	@PostMapping("/gmanager/send.do")
	public String emailSend(String[] email, EmailVO vo, Model model, int[] no ) {
		System.out.println("vo!!!" + vo);

		sendEmail.init();

		int r =0;
		for(int i=0; i<email.length; i++) {
			sendEmail.sendMail(email[i], vo.getE_title(), vo.getE_content());
			vo.setMember_no(service.findMember(email[i]));
			r = service.sendEmail(vo);//, request); /db에 이메일 등록하기 
		}

		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으 메일이 전송되었습니다.");
			model.addAttribute("url", "/tobe/gmanager/email/chiefEmailBox.do"); 
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "전송 오류");
		}

		return "chiefAdmin/common/alert"; 
	}

	@GetMapping("/gmanager/emailBox.do")
	public String emailBox(Model model, EmailVO vo) {
		//db에서 보낸 메일함 가져오기 
		//member이름,제목, 보낸날
		model.addAttribute("map",service.emailList(vo));
		return "chiefAdmin/email/chiefEmailBox"; 
	}

	@GetMapping("/gmanager/memberListEmail.do")
	public String eMemberList(Model model, MemberVO vo ) {
		model.addAttribute("map", service.memberListS(vo));
		System.out.println( service.memberListS(vo));
		return "chiefAdmin/email/chiefMemberListEmail"; 
	}

	@GetMapping("/gmanager/email.do")
	public String index() {

		return "chiefAdmin/email/chiefEmailIndex"; 
	}
	//member
	@GetMapping ("/gmanager/member.do")
	public String cheifMemberIndex(Model model, MemberVO vo) {
		model.addAttribute("map", service.cmemberList(vo));		
		return "chiefAdmin/member/chiefMemberIndex"; 
	}

	@PostMapping ("/gmanager/member.do")
	public String cheifMemberindex(MemberVO vo, Model model) {
		int r = service.update(vo);
		String msg="";
		String url="member.do";
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정사항이 없습니다";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","move");
		return "chiefAdmin/common/alert";
	}

	@GetMapping ("/gmanager/memberDetail.do")
	public String cheifMemberDetail(Model model, int no) {
		model.addAttribute("map", service.detail(no));
		return "chiefAdmin/member/chiefMemberDetail"; 
	}
}