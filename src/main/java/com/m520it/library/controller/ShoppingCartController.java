package com.m520it.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.bean.Mylibrary;
import com.m520it.library.bean.ShoppingCart;
import com.m520it.library.service.LibraryMessagesService;
import com.m520it.library.service.MyLibraryService;
import com.m520it.library.service.ShoppingCartService;
import com.m520it.library.utils.JsonResult;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartController {

	@Autowired
	private LibraryMessagesService service;
	@Autowired
	private ShoppingCartService Cservice;
	@Autowired
	private MyLibraryService Mservice;

	@RequestMapping("/showPage")
	public String showPage() {
		// System.out.println("nihao");
		return "shoppingCart";
	}

	@RequestMapping("/joinShoppingCart")
	@ResponseBody
	public JsonResult joinShoppingCart(Integer id) {
		JsonResult result = new JsonResult();
		ShoppingCart cart = new ShoppingCart();
		LibraryMessages book = service.getBook(id);
		String bookname = book.getBookname();
		String imageadress = book.getImageadress();
		String isbn = book.getIsbn();

		String author = book.getAuthor();
		cart.setAuthor(author);
		cart.setBookname(bookname);
		cart.setImageadress(imageadress);
		cart.setIsbn(isbn);
		Integer count = Cservice.saveBook(cart);
		if (count != 0) {
			result.setState(1);
			return result;
		}
		result.setState(0);
		return result;
	}

	@RequestMapping("/listAll")
	@ResponseBody
	public JsonResult listAll(Integer pn) {
		PageHelper.startPage(pn, 5);
		List<ShoppingCart> listAll = Cservice.selectAll();
		PageInfo<ShoppingCart> pageInfo = new PageInfo<ShoppingCart>(listAll, 3);

		return new JsonResult(pageInfo);
	}

	@RequestMapping("/searchToShopping")
	@ResponseBody
	public JsonResult searchToShopping(Integer id) {
		JsonResult result = new JsonResult();

		ShoppingCart book = Cservice.getBook(id);
		String author = book.getAuthor();
		String imageAdress = book.getImageadress();
		String bookName = book.getBookname();
		String ISBN = book.getIsbn();

		Mylibrary mylibrary = new Mylibrary();
		mylibrary.setAuthor(author);
		mylibrary.setBookname(bookName);
		mylibrary.setImageadress(imageAdress);
		mylibrary.setIsbn(ISBN);
		Integer count = Mservice.insertBook(mylibrary);
		if (count != 0) {
			result.setState(1);
			return result;
		}
		result.setState(0);
		return result;
	}

	@RequestMapping("/bookDelete")
	@ResponseBody
	public JsonResult bookDelete(Integer id) {
		JsonResult result = new JsonResult();
		Integer count = Cservice.deleteBook(id);
		if (count != 0) {
			result.setState(1);
			return result;
		}
		result.setState(0);
		return result;
	}
}
