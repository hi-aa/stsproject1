package com.project.timetable.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.timetable.model.Banner;

@Mapper
public interface ApiMapper {
	public List<Banner> selectBannerList(String bannerType);
}
