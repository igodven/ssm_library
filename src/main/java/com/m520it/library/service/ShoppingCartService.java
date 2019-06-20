package com.m520it.library.service;

import java.util.List;

import com.m520it.library.bean.ShoppingCart;

public interface ShoppingCartService {
	Integer saveBook(ShoppingCart shoppingCart);
	List<ShoppingCart> selectAll();
	ShoppingCart getBook(Integer pn);
	Integer deleteBook(Integer id);
}
