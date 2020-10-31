drop table movie;

create table movie (
    movie_num    	number(10) not null,
    movie_name  	varchar2(50) not null,
    movie_person  	varchar2(2000) not null,
    movie_content   varchar2(50) not null,
    movie_genre  	varchar2(50) not null,
    movie_country  	varchar2(100) not null,
    movie_time    	varchar2(50) not null,
    movie_star  	number(10) not null,
    movie_year  	number(10) not null,
    primary key(movie_num)
);

create table mapMemberMovie(
    movie_num   number(10) not null,
    userId      varchar2(50) not null,
    movie_star  number(10)  not null,
    constraint mappk primary key (movie_num,userId)
);