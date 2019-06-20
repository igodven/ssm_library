package com.m520it.library.service;

import java.util.List;

import com.m520it.library.bean.Mylibrary;

public interface MyLibraryService {
	Integer insertBook(Mylibrary myLibrary);
	List<Mylibrary> selectAll();
}
