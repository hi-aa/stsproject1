package com.project.timetable.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.timetable.mapper.ApiMapper;
import com.project.timetable.model.Banner;

@Service
public class ApiService {

	@Autowired
	private ApiMapper apiMapper;

	public List<Banner> selectBannerList(String bannerType) {
		return apiMapper.selectBannerList(bannerType);
	}


}
