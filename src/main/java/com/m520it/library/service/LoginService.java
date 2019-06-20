package com.m520it.library.service;

import java.util.List;

import com.m520it.library.bean.Login;

public interface LoginService {
	
	List<Login> listAll();
	Long checkLogin(String userName,String password);
	Long checkLoginName(String userName);
    Integer insertUserMessage(Login login);
}
