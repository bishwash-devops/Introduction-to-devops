--- mysql>
--- create user 'testuser'@'%' identified by 'password';
--- grant all on *.* to 'testuser' identified by 'password';
 
--- $ vi /etc/my.cnf
--- [mysqld]
--- bind-address=0.0.0.0

create database UserDB;

use UserDB;

CREATE TABLE UserDB.`users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8