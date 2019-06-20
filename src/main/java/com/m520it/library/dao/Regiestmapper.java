package com.m520it.library.dao;

import com.m520it.library.bean.Regiest;

public interface Regiestmapper {
	//保存操作
	Integer insert(Regiest regiest);
	//更新操作
	Integer update(Regiest regiest);
}
