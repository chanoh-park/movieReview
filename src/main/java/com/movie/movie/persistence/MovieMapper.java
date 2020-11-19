package com.movie.movie.persistence;



import java.util.List;


import com.movie.movie.model.MovieVO;

public interface MovieMapper {
	public void insertMovie(MovieVO movie);
	public List<MovieVO> selectMovie();
	public void updateMovie(MovieVO movie);
	public void deleteMovie(int movieNum);
	public MovieVO readMovie(int movieNum);
}
