package com.project.timetable.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.timetable.api.service.ApiService;
import com.project.timetable.api.service.ApiService2;
import com.project.timetable.model.Banner;
import com.project.timetable.model.TestList;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class ApiController {
	@Autowired
	private ApiService apiService;

	@Autowired
	private ApiService2 apiService2;

	@GetMapping(path = "/api/getBannerList")
	public ResponseEntity<List<Banner>> selectBannerList(@RequestParam String bannerType) {
		List<Banner> result = apiService.selectBannerList(bannerType);

		return new ResponseEntity<List<Banner>>(result, HttpStatus.OK);
	}

	@GetMapping(path = "/api/getTestList")
	public ResponseEntity<List<TestList>> selectTestList(@RequestParam String listType) {
		List<TestList> result = apiService2.selectTestList(listType);
		return new ResponseEntity<List<TestList>>(result, HttpStatus.OK);
	}

	@PostMapping(path = "/api/insertTest")
	public ResponseEntity<Boolean> insertTest(@RequestBody TestList testList) {
		int result = apiService2.insertTest(testList);
		if(result == 1) {
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
