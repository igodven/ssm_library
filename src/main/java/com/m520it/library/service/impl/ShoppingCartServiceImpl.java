package com.m520it.library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m520it.library.bean.ShoppingCart;
import com.m520it.library.dao.ShoppingCartMapper;
import com.m520it.library.service.ShoppingCartService;
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Autowired
	private ShoppingCartMapper mapper;

	public Integer saveBook(ShoppingCart shoppingCart) {
		return mapper.insert(shoppingCart);
	}

	public List<ShoppingCart> selectAll() {
		List<ShoppingCart> listAll= mapper.selectByExample(null);
		return listAll;
	}

	public ShoppingCart getBook(Integer pn) {
		ShoppingCart book=mapper.selectByPrimaryKey(pn);
		return book;
	}

	public Integer deleteBook(Integer id) {
		Integer count=mapper.deleteByPrimaryKey(id);
		return count;
	}
	
}
