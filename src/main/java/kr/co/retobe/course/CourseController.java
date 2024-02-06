package kr.co.retobe.course;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {
	
	@GetMapping("/user/common/userTestSchedule.do")
	public String userTestSchedule() {
		return "user/common/userTestSchedule";
	}

}
