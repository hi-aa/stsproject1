package com.project.timetable.model;

import org.springframework.lang.Nullable;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
//@NoArgsConstructor
public class TestList {
	long listKey;
	String listType;
	String listTitle;
	String listConts;
	String useYn;
}
