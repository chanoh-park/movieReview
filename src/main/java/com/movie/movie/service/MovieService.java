package com.movie.movie.service;

import java.util.List;

import com.movie.movie.model.MovieVO;

public interface MovieService {
	public void insertMovie(MovieVO movie);
	public List<MovieVO> selectMovie();
	public void updateMovie(MovieVO movie);
	public void deleteMovie(int movieNum);
	public MovieVO readMovie(int movieNum);
}
