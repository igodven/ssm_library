package com.m520it.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.m520it.library.bean.Login;
import com.m520it.library.service.LoginService;
import com.m520it.library.utils.JsonResult;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService service;
	
	@RequestMapping("/loginCheck")
	@ResponseBody
	public JsonResult login(String userName,String password) {
		JsonResult result=new JsonResult();
		Long count=service.checkLogin(userName, password);
		if(count==0) {
			result.setState(0);
			return result;
		}
		result.setState(1);
		return result;	
	}
	
	
	@RequestMapping("/listAll")
	public String listAll(Model model) {
		List<Login> listAll=service.listAll();
		model.addAttribute("logins", listAll);
		System.out.println(listAll); 
		return "list";
		
	}
}
