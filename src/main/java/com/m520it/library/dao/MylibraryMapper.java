package com.m520it.library.dao;

import com.m520it.library.bean.Mylibrary;
import com.m520it.library.bean.MylibraryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MylibraryMapper {
    long countByExample(MylibraryExample example);

    int deleteByExample(MylibraryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Mylibrary record);

    int insertSelective(Mylibrary record);

    List<Mylibrary> selectByExample(MylibraryExample example);

    Mylibrary selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Mylibrary record, @Param("example") MylibraryExample example);

    int updateByExample(@Param("record") Mylibrary record, @Param("example") MylibraryExample example);

    int updateByPrimaryKeySelective(Mylibrary record);

    int updateByPrimaryKey(Mylibrary record);
}