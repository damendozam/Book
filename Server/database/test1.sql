create database if not exists test;
use test;

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



/*Connection to dataBase*/
/*
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_new_password';
FLUSH PRIVILEGES;
quit
*/