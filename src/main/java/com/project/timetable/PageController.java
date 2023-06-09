package com.project.timetable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/main")
	public String main() {
		return "views/main";
	}
	@GetMapping("/product")
	public String product() {
		return "views/product";
	}

}
