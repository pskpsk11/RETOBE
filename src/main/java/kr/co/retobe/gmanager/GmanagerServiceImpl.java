package kr.co.retobe.gmanager;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.retobe.vo.CourseVO;
import kr.co.retobe.vo.EmailVO;
import kr.co.retobe.vo.FaqVO;
import kr.co.retobe.vo.MemberVO;
import kr.co.retobe.vo.NoticeVO;
import kr.co.retobe.vo.QnaVO;

@Service
public class GmanagerServiceImpl implements GmanagerService{

	@Autowired
	GmanagerMapper mapper;
	//common
	@Override
	public Map<String, Object> pay_chargeTotal() {
		return mapper.pay_chargeTotal();
	};

	@Override 
	public List<Map<String, Object>> qna(QnaVO qvo) {
		return mapper.qna(qvo);
	}

	@Override
	public int totalCount() {
		return mapper.totalCount();
	}
	//course
	@Override
	public boolean insert(CourseVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
	          // 파일명
	          String org = file.getOriginalFilename();
	          String ext = org.substring(org.lastIndexOf("."));
	          String real = System.currentTimeMillis()+ext;
	          // 파일저장
	          String path = request.getRealPath("/upload/")+real;
	          try {
	             file.transferTo(new File(path));
	          } catch (Exception e) {}
	          vo.setTeacher_img_org(org);
	          vo.setTeacher_img_real(real);
	       }

		return mapper.insert(vo) > 0 ? true : false;
	}
	@Override
	public int update (CourseVO vo) {
		return mapper.courseUpdate(vo);
	}

	@Override
	public CourseVO modcourse(int no) {
		return mapper.modcourse(no);
	}

	//
	@Override
	public Map<String, Object> courseListS(CourseVO param) {
		int count = mapper. courseCount(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<CourseVO> list = mapper.courseList(param); // 목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);

        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
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
	//customer
	@Override
	public boolean insert(NoticeVO vo) {
//		if (!file.isEmpty()) {
//	          // 파일명
//	          String org = file.getOriginalFilename();
//	          String ext = org.substring(org.lastIndexOf("."));
//	          String real = System.currentTimeMillis()+ext;
//	          // 파일저장
//	          String path = request.getRealPath("/upload/")+real;
//	          try {
//	             file.transferTo(new File(path));
//	          } catch (Exception e) {}
//	          vo.setTeacher_img_org(org);
//	          vo.setTeacher_img_real(real);
//	       }

		return mapper.insert(vo) > 0 ? true : false;
	}

	@Override
	public boolean faqinsert(FaqVO vo) {
		return mapper.faqinsert(vo) > 0 ? true : false;
	}

	 @Override
	   public Map<String, Object> noticeList(NoticeVO param) {
	      int count = mapper.noticeCount(param); //총개수
	        int totalPage = count / 10; //총 페이지
	        if (count % 10 > 0) totalPage++;
	        System.out.println(param.getPage());
	        System.out.println(param.getStartIdx());
	        List<NoticeVO> noticeList = mapper.noticeList(param); //목록

	        Map<String, Object> map = new HashMap<>();
	        map.put("count", count);
	        map.put("totalPage", totalPage);
	        map.put("list", noticeList);

	        //페이징
	        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
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
	public List<NoticeVO> getlist(NoticeVO vo) {	
		return mapper.getlist(vo);
	}

	@Override
	public NoticeVO getNoticeDetail(int noticeNo) {
		return mapper.NoticeDetail(noticeNo);
	}

	@Override
	public List<QnaVO> getqnalist(QnaVO vo) {	
		return mapper.getqnalist(vo);
	}

	@Override
	public QnaVO getQnaDetail(int qnaNo) {
		return mapper.QnaDetail(qnaNo);
	}

	@Override
	public List<FaqVO> getfaqlist(FaqVO vo) {	
		return mapper.getfaqlist(vo);
	}

	@Override
	public int QnaReply(QnaVO vo) {
		return mapper.replyInsert(vo);
	}

	@Override
	public Map<String, Object> qnaList(QnaVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	//email
	@Override
	public String memberEmail(int no) {
		return mapper.emailSelect(no);
	}

	@Override
	public int sendEmail(EmailVO vo) {
		return mapper.emailInsert(vo);
	}

	@Override
	public Map<String, Object> emailList(EmailVO param) {

		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 20;
        if (count % 20 > 0) totalPage++;
        List<EmailVO> list = mapper.emailList(param); // 목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);

        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/20.0)*20);
        int startPage = endPage - 19;
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
	public int findMember(String email) {
		return mapper.memberSelect(email);
	}

	@Override
	public Map<String, Object> memberListS(MemberVO param) {
		int count = mapper.memberCount(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<MemberVO> list = mapper.memberList(param); // 목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);

        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
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
	//member
	@Override
	public MemberVO detail(int no) {
		return mapper.cmemberDetail(no);
	}
	@Override
	public int update (MemberVO vo) {
		return mapper.cmemberUpdate(vo);
	}

	@Override
	public Map<String, Object> cmemberList(MemberVO param) {
		int count = mapper.cmemberCount(param); //총개수
        int totalPage = count / 10; //총 페이지
        if (count % 10 > 0) totalPage++;
        System.out.println(param.getPage());
        System.out.println(param.getStartIdx());
        List<MemberVO> cmemberList = mapper.cmemberList(param); //목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", cmemberList);

        //페이징
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
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
}