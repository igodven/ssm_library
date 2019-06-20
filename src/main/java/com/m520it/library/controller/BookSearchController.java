package com.m520it.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.service.LibraryMessagesService;

@Controller
@RequestMapping("/BookSearch")
public class BookSearchController {

	@Autowired
	private LibraryMessagesService service;

	@RequestMapping("/listAll")
	public String listAll(@RequestParam String bookName, Model model) {
		List<LibraryMessages> listAll = service.getBook(bookName);
		model.addAttribute("bookAll", listAll);
		return "bookSearch";

	}
}
