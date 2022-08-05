package com.btaylor.displaydate;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	Calendar rightNow = Calendar.getInstance();
	Date date = rightNow.getTime();
	SimpleDateFormat format1 = new SimpleDateFormat("h:mm a");
	SimpleDateFormat format2 = new SimpleDateFormat("EEEE, MMMM d, yyyy");
	String currentTime = format1.format(date);
	String currentDate = format2.format(date);
	
	@RequestMapping("/")
	public String dashboard() {
		return "dashboard.jsp";
	}
	
	@RequestMapping("/date")
	public String date(Model model) {
		model.addAttribute("date", currentDate);
		return "date.jsp";
	}
	
	@RequestMapping("/time")
	public String currentTime(Model model) {
		model.addAttribute("time", currentTime);
		return "time.jsp";
	}
}
