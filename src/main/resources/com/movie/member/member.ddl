drop table member;

create table member (
    name    varchar2(50) not null,
    userId  varchar2(50) not null,
    userPw  varchar2(100) not null,
    primary key(userId)
);