package kr.co.retobe.cousre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseMapper mapper;
}
