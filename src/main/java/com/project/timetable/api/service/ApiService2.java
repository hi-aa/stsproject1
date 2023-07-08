package com.project.timetable.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.timetable.mapper.ApiMapper2;
import com.project.timetable.model.TestList;

@Service
public class ApiService2 {
	@Autowired
	public ApiMapper2 apiMapper2;

	public List<TestList> selectTestList(String listType) {
		return apiMapper2.selectTestList(listType);
	}

	public int insertTest(TestList testList) {
		return apiMapper2.insertTest(testList);
	}
}
