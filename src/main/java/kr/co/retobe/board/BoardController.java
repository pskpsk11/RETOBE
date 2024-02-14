package kr.co.retobe.board;

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

import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;
import kr.co.retobe.vo.ReviewVO;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@GetMapping("/user/reviewWrite.do")
	public String write( @RequestParam("infoCourse_no") String infoCourse_no,
						 @RequestParam("infoDetail_no") String infoDetail_no,
						 @RequestParam("infoCourseName") String infoCourseName,
						 Model model, HttpSession sess ) {
		MemberVO user = (MemberVO)sess.getAttribute("loginInfo");

		model.addAttribute("infoCourse_no", infoCourse_no);
		model.addAttribute("infoDetail_no", infoDetail_no);
		model.addAttribute("infoCourseName", infoCourseName );
		
		return "/user/review/userReviewForm";
	}
	
	@PostMapping("/user/reviewInsert.do")
	public String insert(HttpServletRequest request, ReviewVO rvo, Model model) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("loginInfo");
		rvo.setMember_no(login.getMember_no());
		
		int r = service.insertReview(rvo);
		double rating = (rvo.getR_rating() + service.selectCourseRating(rvo.getCourse_no()))/2.0;
		int rr = service.updateCourseRating(rating+"", rvo.getCourse_no()+"");
		
		if (r > 0 &&  rr> 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/tobe/user/mypage.do"); //url : 후기 목록..? 마이페이지?
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "user/common/userAlert";
	}
	
	
	@GetMapping("/user/reviewEdit.do")
	public String reviewEdit(Model model,ReviewVO vo) {
		int r = service.updateReview(vo);//, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "??");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "/user/review/userModReviewForm";
	}
	
	//후기 수정
//	@PostMapping("/user/course/qna/update.do")
//	public String update(Model model,ReviewVO vo){//, MultipartFile file) {
//		int r = service.updateReview(vo);//, file, request);
//		if (r > 0) {
//			model.addAttribute("cmd", "move");
//			model.addAttribute("msg", "정상적으로 수정되었습니다.");
//			model.addAttribute("url", "??");
//		} else {
//			model.addAttribute("cmd", "back");
//			model.addAttribute("msg", "등록 오류");
//		}
//		return "user/common/userAlert";
//	}
	
	@GetMapping("/user/reviewIndex.do")
	public String getSelectReviewNo(Model model, ReviewVO rvo) {
		List<Map<String, Object>> ReviewList = service.getSelectReviewNo();
		model.addAttribute("ReviewList", ReviewList);
		return "user/review/userReviewIndex";
	}
	
	@GetMapping("/user/reviewDetail.do")
    public String getReviewDetail(Model model, @RequestParam("review_no") int review_no) {
        ReviewVO review = service.getReviewDetail(review_no);
        model.addAttribute("review", review);
        return "user/review/userReviewDetail";
    }
	//수정중!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@GetMapping("/user/review/userModReviewForm.do")
	public String getModReviewDetail(Model model, @RequestParam("reviewNo") int reviewNo) {
		ReviewVO review = service.getReviewDetail(reviewNo);
		model.addAttribute("review", review);
		return "user/review/userModReviewForm";
	}
	
	
	@GetMapping("/user/qna.do")
	public String userQna(Model model, QnaVO vo) {
		model.addAttribute("map", service.qnaList(vo));
		return "user/customer/userQna";
	}
	//고객센터 공지사항
	@GetMapping("/user/notice.do")
	public String userCustomer(Model model, NoticeVO vo) {
		model.addAttribute("map", service.noticeList(vo));
		return "user/customer/userCustomer";
	}
	
	@GetMapping("/user/faq.do")
	public String userFaq(Model model, FaqVO vo) {
		model.addAttribute("map", service.faqList(vo));
		return "user/customer/userFaq";
	}
	//상세
	@GetMapping("/user/noticeDetail.do")
	public String view(Model model,  NoticeVO vo) {
		model.addAttribute("vo", service.noticeDetail(vo));
		return "user/customer/userNoticeDetail";
	}
	//문의 상세
	@GetMapping("/user/qnaDetail.do")
	public String viewQnaDetail(Model model,  QnaVO vo) {
		model.addAttribute("vo", service.qnaDetail(vo));
		return "user/customer/userQnaDetail";
	}
	
	@GetMapping("/user/userAskForm.do")
	public String userAskForm() {
		return "user/customer/userAskForm";
	}
	
	//강좌 문의 등록 
	@PostMapping("/user/customer/qna/insert.do")
	public String insert(Model model, HttpServletRequest request, QnaVO vo) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("loginInfo");
		vo.setMember_no(login.getMember_no());
		int r = service.qnaInsert(vo);//, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/tobe/user/customer/userQna.do"); //돌아갈 페이지 박모훈 완성 후 ..
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "user/common/userAlert";
	}
	//수정 이동 view
	@GetMapping("/user/customer/userModAskForm.do")
	public String edit(Model model, QnaVO vo) {
		model.addAttribute("vo", service.view(vo, false)); 
		
		return "user/customer/userModAskForm";
	}
	//강좌 문의 수정 
	@PostMapping("/user/customer/qna/update.do")
	public String update(Model model, HttpServletRequest request, QnaVO vo){//, MultipartFile file) {
		int r = service.qnaUpdate(vo);//, file, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "/tobe/user/customer/userQna.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "user/common/userAlert";
	}
	//강좌 문의 삭제 
	@GetMapping("/user/customer/qna/delete.do")
	public String delete(Model model, HttpServletRequest request, QnaVO vo) {//, MultipartFile file) {
		int r = service.qnaDelete(vo);//, request);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "/tobe/user/customer/userQna.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "user/common/userAlert";
	}
}
