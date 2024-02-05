package kr.co.retobe.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerMapper mapper;
}
