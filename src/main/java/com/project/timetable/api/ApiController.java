package com.project.timetable.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.timetable.api.service.ApiService;

@RestController
public class ApiController {

	@Autowired
	private ApiService apiService;

	@GetMapping(path = "/api/testList")
	public ResponseEntity<Map<String, Object>> selectList(@RequestParam Map<String, Object> param) {

		Map<String, Object> data = new HashMap<>();
		List<Map<String, Object>> sampleList = new ArrayList<>();

		if(param.get("id") == null || "".equals(String.valueOf(param.get("id")))) {
			data.put("resMessage", "ID Required.");
			return new ResponseEntity<Map<String,Object>>(data, HttpStatus.BAD_REQUEST);
		}

		for(int i = 0; i < 10; i++) {
			Map<String, Object> tmp = new HashMap<>();
			tmp.put("id", i + 1);
			tmp.put("name", "name" + (i + 1));
			sampleList.add(tmp);
		}
		data.put("list", sampleList);

		return new ResponseEntity<Map<String,Object>>(data, HttpStatus.OK);
	}

	@GetMapping(path = "/api/getBannerList")
	public ResponseEntity<List<Map<String, Object>>> selectBannerList() {

		List<Map<String, Object>> result = apiService.selectBannerList();

		return new ResponseEntity<List<Map<String, Object>>>(result, HttpStatus.OK);
	}
}
