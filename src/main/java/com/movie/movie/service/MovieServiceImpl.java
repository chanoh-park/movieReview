package com.movie.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.model.MovieVO;
import com.movie.movie.persistence.MovieMapper;

import lombok.Setter;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Setter(onMethod_ = @Autowired)
	private MovieMapper moviemapper;

	@Override
	public void insertMovie(MovieVO movie) {
		// TODO Auto-generated method stub
		moviemapper.insertMovie(movie);
	}

	@Override
	public List<MovieVO> selectMovie() {
		// TODO Auto-generated method stub
		return moviemapper.selectMovie();
	}

	@Override
	public void updateMovie(MovieVO movie) {
		// TODO Auto-generated method stub
		moviemapper.updateMovie(movie);
		
	}

	@Override
	public void deleteMovie(int movieNum) {
		// TODO Auto-generated method stub
		moviemapper.deleteMovie(movieNum);
	}

	@Override
	public MovieVO readMovie(int movieNum) {
		// TODO Auto-generated method stub
		return moviemapper.readMovie(movieNum);
	}

}
