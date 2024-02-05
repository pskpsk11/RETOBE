package kr.co.retobe.gmanager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GmanagerServiceImpl implements GmanagerService{

	@Autowired
	GmanagerMapper mapper;
}
