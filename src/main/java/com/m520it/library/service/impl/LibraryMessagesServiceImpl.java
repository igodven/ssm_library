package com.m520it.library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.bean.LibraryMessagesExample;
import com.m520it.library.bean.LibraryMessagesExample.Criteria;
import com.m520it.library.dao.LibraryMessagesMapper;
import com.m520it.library.service.LibraryMessagesService;
@Service
public class LibraryMessagesServiceImpl implements LibraryMessagesService{

	@Autowired 
	private LibraryMessagesMapper mapper;
	
	public List<LibraryMessages> selectAll() {
		List<LibraryMessages> listAll=mapper.selectByExample(null);
		return listAll;
	}

	public LibraryMessages getBook(Integer id) {
		LibraryMessages book=mapper.selectByPrimaryKey(id);
		return book;
	}

	public Integer updateMessage(Integer id, LibraryMessages message) {
		LibraryMessagesExample example=new LibraryMessagesExample();
		Criteria cra=example.createCriteria();
		cra.andIdEqualTo(id);
		Integer count=mapper.updateByExample(message, example);
		return count;
	}

	public List<LibraryMessages> getBook(String bookName) {
		LibraryMessagesExample example=new LibraryMessagesExample();
		Criteria cra=example.createCriteria();
		//Ä£ºý²éÑ¯
		cra.andBooknameLike("%"+bookName+"%");
		List<LibraryMessages> listAll=mapper.selectByExample(example);
		return listAll;
	}
	
}
