package com.m520it.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.bean.Mylibrary;
import com.m520it.library.service.LibraryMessagesService;
import com.m520it.library.service.MyLibraryService;
import com.m520it.library.utils.JsonResult;

@Controller
@RequestMapping("/MyLibrary")
public class MyLibraryController {

	@Autowired
	private LibraryMessagesService Lservice;
	@Autowired
	private MyLibraryService Mservice;

	@RequestMapping("/showPage")
	public String showPage() {
		//System.out.println("nihao");
		return "shopping";
	}
	
	@RequestMapping("/saveBook")
	@ResponseBody
	public JsonResult saveBook(Integer id) {
		JsonResult result = new JsonResult();
		LibraryMessages message = Lservice.getBook(id);
		String author = message.getAuthor();
		String bookName = message.getBookname();
		String imageAdress = message.getImageadress();
		String ISBN = message.getIsbn();
		//如果库存大于零,才能进行购买,否则提醒用户库存不足,或者购买失败
		if (message.getStock() > 0) {

			message.setStock((message.getStock() - 1));

			Mylibrary myLibrary = new Mylibrary();
			myLibrary.setAuthor(author);
			myLibrary.setBookname(bookName);
			myLibrary.setImageadress(imageAdress);
			myLibrary.setIsbn(ISBN);
			Integer count = Mservice.insertBook(myLibrary);
			Lservice.updateMessage(id, message);
			if (count != 0) {
				result.setState(1);
				return result;
			}
			result.setState(0);

			return result;

		}else {
			result.setState(0);
			return result;
		}
	}
	
	@RequestMapping("/shoppingBook")
	public String shoppingBook(Integer id,Model model) {
		
		LibraryMessages message = Lservice.getBook(id);
		String author = message.getAuthor();
		String bookName = message.getBookname();
		String imageAdress = message.getImageadress();
		String ISBN = message.getIsbn();
		//如果库存大于零,才能进行购买,否则提醒用户库存不足,或者购买失败
		if (message.getStock() > 0) {
			
			message.setStock((message.getStock() - 1));
			
			Mylibrary myLibrary = new Mylibrary();
			myLibrary.setAuthor(author);
			myLibrary.setBookname(bookName);
			myLibrary.setImageadress(imageAdress);
			myLibrary.setIsbn(ISBN);
			Integer count = Mservice.insertBook(myLibrary);
			Lservice.updateMessage(id, message);
			return "shopping";
		}
		
		return "bookSearch";
		
	}
	
	@RequestMapping("/listAll")
	@ResponseBody
	public JsonResult listAll(Integer pn) {
		PageHelper.startPage(pn, 3);
		List<Mylibrary> listAll=Mservice.selectAll();
		PageInfo<Mylibrary> pageInfo=new PageInfo<Mylibrary>(listAll,3);
		return new JsonResult(pageInfo);
		
	}
}
