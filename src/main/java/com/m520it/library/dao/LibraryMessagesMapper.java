package com.m520it.library.dao;

import com.m520it.library.bean.LibraryMessages;
import com.m520it.library.bean.LibraryMessagesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LibraryMessagesMapper {
    long countByExample(LibraryMessagesExample example);

    int deleteByExample(LibraryMessagesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LibraryMessages record);

    int insertSelective(LibraryMessages record);

    List<LibraryMessages> selectByExample(LibraryMessagesExample example);

    LibraryMessages selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LibraryMessages record, @Param("example") LibraryMessagesExample example);

    int updateByExample(@Param("record") LibraryMessages record, @Param("example") LibraryMessagesExample example);

    int updateByPrimaryKeySelective(LibraryMessages record);

    int updateByPrimaryKey(LibraryMessages record);
}