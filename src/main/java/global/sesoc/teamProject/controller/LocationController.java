package global.sesoc.teamProject.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamProject.dao.locationDAO;
import global.sesoc.teamProject.vo.locker_info;
import global.sesoc.teamProject.vo.locker_location;

@Controller
@RequestMapping("location")
public class LocationController {

	@Autowired
	private locationDAO dao;
	
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		ArrayList<locker_location>location = dao.listLocation();
		JSONArray arr = new JSONArray(location);
		model.addAttribute("location", arr);
		return "location/location";
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(String locker_name, Model model) {
		model.addAttribute("locker_name", locker_name);
		return "booking";
	}
	
	@ResponseBody
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public locker_info insertlocker(String	locker_name) {
		locker_info info = dao.infolocker(locker_name);
		return info;
	}
}