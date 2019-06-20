package com.m520it.library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m520it.library.bean.Mylibrary;
import com.m520it.library.dao.MylibraryMapper;
import com.m520it.library.service.MyLibraryService;

@Service
public class MyLibraryServiceImpl implements MyLibraryService{

	@Autowired
	private MylibraryMapper mapper;

	public Integer insertBook(Mylibrary myLibrary) {
		return mapper.insert(myLibrary);
	}

	public List<Mylibrary> selectAll() {
		List<Mylibrary> listAll=mapper.selectByExample(null);
		return listAll;
	}
	
}
