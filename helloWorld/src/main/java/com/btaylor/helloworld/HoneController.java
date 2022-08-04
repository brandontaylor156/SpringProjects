package com.btaylor.helloworld;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HoneController {
	
	@RequestMapping("")
	public String index() {
		return "Hello World!";
	}
	
	@RequestMapping("/hey")
	public Integer hey() {
		return 33;
	}

}
