package com.movie.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.movie.model.MovieVO;
import com.movie.movie.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/movie/*")
@AllArgsConstructor
public class MovieController {
	private MovieService movieservice;
	
	@GetMapping("/list")
	public void movieList(Model model) {
		log.info("list");
		model.addAttribute("list", movieservice.selectMovie());
	}
	
	@GetMapping("/read")
	public void readMovie(@RequestParam("movieNum") int movieNum, Model model) {
		model.addAttribute("movie", movieservice.readMovie(movieNum));
	}
	
	@GetMapping("/register")
	public void openRegisterProject() {
		
	}
	
	@PostMapping("/register")
	public String registerMovie(MovieVO movie, RedirectAttributes rttr) {
		movieservice.insertMovie(movie);
		rttr.addFlashAttribute("result", movie.getMovieNum());
		return "redirect:/movie/list";
	}
	
	@GetMapping("/modify")
	public void openModifyMovie(@RequestParam("movieNum") int movieNum, Model model) {
		model.addAttribute("movie", movieservice.readMovie(movieNum));
	}
	
	@PostMapping("/modify")
	public String modifyMovie(MovieVO movie, RedirectAttributes rttr) {
		movieservice.updateMovie(movie);
		rttr.addFlashAttribute("result", "success");
			
		return "redirect:/movie/list";
		
	}

	@PostMapping("/remove")
	public String removeMovie(@RequestParam("movieNum") int movieNum, RedirectAttributes rttr) {
		movieservice.deleteMovie(movieNum);
		rttr.addFlashAttribute("result", "success");
		log.info("remove"+movieNum);
		return "redirect:/movie/list";
	}
	
}
