# SimpleJavaWeb Lab

Pre-Requisites: 

 * JDK 8
 * Tomcat 8.5
 * MariaDB 10.2
 * MySQL Workbench 6.3 / HeidiSQL
 * Eclipse IDE for Java EE Developers

Steps to Follow:
#### Load Project in Eclipse IDE
* Create New "Dynamic Web Project" with name SimpleJavaWeb in Eclipse IDE, leaving everything default.
* Copy src and WebContent Directory for this Repository and overwrite in the project.
* Resolve Dependency Issues shown in Eclipse "Problems" tab.
	* The import javax.servlet cannot be resolved: Project -> Properties -> Java Build Path -> Libraries -> Add External JARs - Select "servlet-api.jar" from existing tomcat installation TOMCAT_HOME/lib/servlet-api.jar
	* Can not find the tag library descriptor for jstl/core: Copy TOMCAT_HOME/webapps/examples/WEB-INF/lib/* to project's WEB-INF/lib 
* Right Click - Validate -> Fix if more errors exists, Ignore the Warnings.
    
#### Create User and Database in Mariadb
* Start Windows Command Prompt and Run MARIADB_HOME/bin/mysqld - to start mariadb server
* Open MySQL Workbench 6.3 / HeidiSQL and connect to mysql 
	* Host: localhost, Port: 3306, User: root, Password: (leave blank)
* Run SQL Query to Create New User and Grant Access to the Database

```
create user 'testuser'@'localhost' identified by 'testpassword';
GRANT ALL PRIVILEGES ON  *.* to 'mariadb'@'localhost';
FLUSH PRIVILEGES;
```

* Create Database and User Table

```
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
```
 

#### Configure and Run the Application
* In Eclipse, Configure src/db.properties with proper database username and password

```
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:3306/UserDB
user=testuser
password=testpassword
```

* Run Project: Right Click Project Name -> Run as -> Run on Server
* Select Tomcat v8.5 Server -> Next -> Set Tomcat Installation directory and Set JRE to 1.8 -> Click Finish

###### OOps!! Error - ClassNotFoundException: com.mysql.jdbc.driver
* Google - mysql connector jar -> Download -> Extract and Copy the mysql-connector-java*.jar to WEB-INF/lib
* Run Project Again:  Right Click Project Name -> Run as -> Run on Server

If all dependecies are resolved, database is running and configurations are correct, You should have a running Java Web Application!
Congratulation!!!


