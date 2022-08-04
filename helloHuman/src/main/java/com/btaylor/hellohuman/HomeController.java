package com.btaylor.hellohuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HomeController {
		
		@RequestMapping("/")
		public String index(@RequestParam(value="name") String firstName, @RequestParam(value="last_name", required=false) String lastName, @RequestParam(value="times", required=false) int times) {
			String newString = "";
			if (times > 0) {
				if (lastName != null) {
					for (int i = 0; i < times; i++) {
						newString += firstName + " " + lastName + " ";
					}
				}
				else {
					for (int i = 0; i < times; i++) {
						newString += firstName + " ";
					}
				}
			}
			return newString;
		}

	}


