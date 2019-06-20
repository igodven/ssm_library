package com.m520it.library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m520it.library.bean.Login;
import com.m520it.library.bean.LoginExample;
import com.m520it.library.bean.LoginExample.Criteria;
import com.m520it.library.dao.LoginMapper;
import com.m520it.library.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginMapper mapper;

	public List<Login> listAll() {
		List<Login> listAll=mapper.selectByExample(null);
		return listAll;
	}

	public Long checkLogin(String userName, String password) {
		LoginExample example=new LoginExample();
		Criteria cra=example.createCriteria();
		cra.andUsernameEqualTo(userName);
		cra.andPasswordEqualTo(password);
		Long count= mapper.countByExample(example);
		return count;
	}

	public Long checkLoginName(String userName) {
		LoginExample example=new LoginExample();
		Criteria cra=example.createCriteria();
		cra.andUsernameEqualTo(userName);
		Long count=mapper.countByExample(example);
		return count;
	}

	public Integer insertUserMessage(Login login) {
		Integer count=mapper.insert(login);
		return count;
	}


}
