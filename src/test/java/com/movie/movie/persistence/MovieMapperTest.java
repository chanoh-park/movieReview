package com.movie.movie.persistence;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.movie.movie.model.MovieVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MovieMapperTest {
	@Setter(onMethod_ = @Autowired)
	private MovieMapper movieMapper;

//	@Test
	public void test() {
		System.out.println("=====================================");
		System.out.println(movieMapper);
		System.out.println("=====================================");
	}

	@Test
	public void test2() {
		MovieVO movie = new MovieVO();

		movie.setMovieContent("내용내용내용");
		movie.setMovieCountry("한국");
		movie.setMovieGenre("drama");
		movie.setMovieName("영화제목1");
		movie.setMoviePerson("누구누구누구누구");
		movie.setMovieStar(5);
		movie.setMovieTime("1h 50m");
		movie.setMovieYear(2020);

		movieMapper.insertMovie(movie);

		log.info(movie);

	}

//	@Test
	public void test3() {
		movieMapper.selectMovie().forEach(movie -> log.info(movie));
	}

//	@Test 
	public void test4() {
		MovieVO movie = new MovieVO();

		movie.setMovieNum(5);
		movie.setMovieContent("����ȳ���");
		movie.setMovieCountry("����ȳ���");
		movie.setMovieGenre("������帣");
		movie.setMovieName("������̸�");
		movie.setMoviePerson("������⿬��");
		movie.setMovieStar(5);
		movie.setMovieTime("����Ƚð�");
		movie.setMovieYear(2020);

		movieMapper.updateMovie(movie);

		log.info(movie);

	}

	// @Test
	public void test5() {
		MovieVO movie = new MovieVO();

		movie.setMovieNum(4);

		movieMapper.deleteMovie(movie.getMovieNum());

		log.info(movie);
	}

//	@Test
	public void test6() {
		movieMapper.readMovie(6);

	}
}
