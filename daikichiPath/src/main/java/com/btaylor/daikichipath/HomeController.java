package com.btaylor.daikichipath;

import org.springframework.web.bind.annotation.PathVariable;
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
		
		@RequestMapping("/daikichi/travel/{city}")
		public String city(@PathVariable("city") String city) {
			return "Congratulations! You will soon travel to " + city;
		}
		
		@RequestMapping("/daikichi/lotto/{number}")
		public String number(@PathVariable("number") int number) {
			return number % 2 == 0 ? "You will take a grand journey in the near future, but be weary of tempting offers" : "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends.";
		}

	}
