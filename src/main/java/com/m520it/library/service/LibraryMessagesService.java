package com.m520it.library.service;

import java.util.List;

import com.m520it.library.bean.LibraryMessages;

public interface LibraryMessagesService {
	List<LibraryMessages> selectAll();
	LibraryMessages getBook(Integer id);
	Integer updateMessage(Integer id,LibraryMessages message);
	List<LibraryMessages> getBook(String bookName);
}
