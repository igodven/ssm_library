package com.m520it.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.service.LibraryMessagesService;
import com.m520it.library.utils.JsonResult;

@Controller
@RequestMapping("/LibraryMessages")
public class LibraryMessagesController {
	
	@Autowired
	private LibraryMessagesService service;
	
	@RequestMapping("/showPage")
	public String showPage() {
		return "list";
	}
	
	@RequestMapping("/listAll")
	@ResponseBody
	public JsonResult listAll(Integer pn) {
		PageHelper.startPage(pn, 5);
		List<LibraryMessages> listAll=service.selectAll();
		PageInfo<LibraryMessages> pageInfo=new PageInfo<LibraryMessages>(listAll,5);
	    return new JsonResult(pageInfo);
	}
	@RequestMapping("/shoppingCart")
	public String shoppingCart(Integer pn ) {
		PageHelper.startPage(1, 5);
		List<LibraryMessages> listAll=service.selectAll();
		PageInfo<LibraryMessages> pageInfo=new PageInfo<LibraryMessages>(listAll,5);
		return "shoppingCart";
	}
}
