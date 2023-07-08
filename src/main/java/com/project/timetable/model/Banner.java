package com.project.timetable.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Banner {
	long bannerKey;
	String bannerType;
	String filePath;
	String fileNm;
}
