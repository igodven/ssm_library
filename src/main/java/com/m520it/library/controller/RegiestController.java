package com.m520it.library.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.m520it.library.bean.Login;
import com.m520it.library.bean.Regiest;
import com.m520it.library.service.LoginService;
import com.m520it.library.service.RegiestService;
import com.m520it.library.utils.JsonResult;

@Controller
@RequestMapping("/regiest")
public class RegiestController {

	@Autowired
	private RegiestService Rservice;
	@Autowired
	private LoginService Lservice;

	@RequestMapping("/saveUserMessage")
	@ResponseBody
	public JsonResult saveUserMessage(@Valid Regiest regiest) {
		JsonResult result = new JsonResult();
		String username = regiest.getUsername();
		String password = regiest.getPassword();

		// 判断登陆的信息表中是否已经有了这个账号,如果有的话,提醒用户此账号已被注册
		Long checkCount = Lservice.checkLoginName(username);
		if (checkCount == 0) {
			Login login = new Login();
			login.setUsername(username);
			login.setPassword(password);
			Lservice.insertUserMessage(login);

			Integer count = Rservice.saveUserMessage(regiest);
			if (count != 0) {
				result.setState(1);
				return result;
			} else {
				result.setState(0);
				return result;
			}
		}
		result.setState(0);
		return result;
	}
}
