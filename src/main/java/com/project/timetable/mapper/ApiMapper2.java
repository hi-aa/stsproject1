package com.project.timetable.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.timetable.model.TestList;

@Mapper
public interface ApiMapper2 {
	public List<TestList> selectTestList(String listType);

	public int insertTest(TestList testList);
}
