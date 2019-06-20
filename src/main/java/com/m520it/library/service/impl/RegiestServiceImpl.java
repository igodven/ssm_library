package com.m520it.library.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m520it.library.bean.Regiest;
import com.m520it.library.dao.Regiestmapper;
import com.m520it.library.service.RegiestService;

@Service
public class RegiestServiceImpl implements RegiestService{

	@Autowired
	private Regiestmapper mapper;

	public Integer saveUserMessage(Regiest regiest) {

		return mapper.insert(regiest);
	}

}
