package com.movie.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getMain() throws Exception {
		
		log.info("get main");
		
	}
	
}
