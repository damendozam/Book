create database if not exists test;
use library;

/*create table chapters(
	id int(11) not null auto_increment,
    title varchar(45) default null,
);*/

create table books(
	id int(11) not null auto_increment,
    title varchar(45) default null,
    primary key(id) 
);
describe book;