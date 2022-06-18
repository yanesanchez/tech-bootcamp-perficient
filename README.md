# Tech Bootcamp - Perficient
## Table of Contents
- [Lab 1 - The Development Environment](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#lab-1---the-development-environment)
  - [Java](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#java)  
  - [Gradle](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#gradle)  
  - [Git](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#git)  
  - [Spring Boot](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#spring-boot)  
  - [Spring Tool Suite](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#spring-tool-suite)  
  - [MySQL](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#mysql)  
  - [Development Technologies](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#development-technologies)  
- [Lab 2 - Database Systems](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#lab-2---database-systems)  
  - [Objectives]()
  - [The Relational Model](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#the-relational-model)
  - [SQL]()
- [Lab 3 - Spring](https://github.com/yanesanchez/tech-bootcamp-perficient/edit/main/README.md#lab-3---spring)
  - [Objectives]()
  - [Inversion of Control (IoC)]()
  - [REST and MVC]()
  - [Spring JDBC]()

---

# Lab 1 - The Development Environment
## Objectives
- Setup the basic project development environment. Cover concepts including:
  - **Java** - Installing the Java JDK
  - **Gradle** - Installing and building with Gradle
  - **Git** - Installing Git client
  - **STS** - Installing the Spring Tools Suite IDE and importing a Gradle project
  - **Spring Boot App foundation** 
  - **MySQL**

## Java
We will be using JDK v17.
### Installation
[Download JDK](https://www.oracle.com/java/technologies/downloads/)
### Configuration
Add the ```JAVA_HOME``` environment variable pointing to the folder where the JDK was installed; prepend ```%JAVA_HOME%\bin;``` to path variable.  
[Instructions on changing environment and path variables](https://www.java.com/en/download/help/path.html)

## Gradle
Gradle is a build automation tool used for Java projects; it describes how the software should be build and the dependencies to build it.
### Installation
[Instructions on installing Gradle](https://gradle.org/install/)
### Building Code
Gradle can be used to build software projects from the command line or from IDE during a build. This will build the entire project, run all unit tests, and package the project according to the ```pom``` configuration in the target directory of the project.
#### From the Command Line
- Open a cmd console
- Navigate to project source code directory containing the ```build.gradle``` file
- Execute 'gradle clean build'
#### From Eclipse (imported as a Gradle Project)
- In task bar: ```Project -> Build All``` (greyed out if 'build automatically' is selected)
#### Gradle Resources
[Gradle Guide](https://docs.gradle.org/current/samples/sample_building_java_libraries.html)  
[Springboot-Gradle Tutorial](https://spring.io/guides/gs/gradle/)  
[Maven Repository](https://mvnrepository.com/)   
[Central Repository](https://search.maven.org/#browse)

## Git
Git is a Source Control Manager (SCM) originally written and developed for maintaining the Linux Kernel source code.
### Git Resources
[Quick Git CLI Tutorial](https://docs.github.com/en/get-started/quickstart/set-up-git)  
[Reference Manual and Pro Git book](https://git-scm.com/doc)  
[Common git workflow/branching strategies](https://www.atlassian.com/git/tutorials/comparing-workflows)

## Spring Boot
### Generate Spring project
[Spring Initializr](https://start.spring.io/)
### Spring Resources
[Spring Boot Docs](https://docs.spring.io/spring-boot/docs/current/reference/html/)  
[Spring Framework Docs](https://docs.spring.io/spring-framework/docs/current/reference/html/)  
[Spring Guides](https://spring.io/guides)  

## Spring Tool Suite
IDE, or Integrated Development Environment, based on Eclipse.
### Installation
[Spring Tools | 4](https://spring.io/tools)
### Plugins
- Install from Eclipse Marketplace in STS
- Go to: ```Menu -> Help -> Eclipse Marketplace```
### Import Gradle Project
- Go to: ```File -> Import... -> Gradle -> Existing Gradle Project -> Next```
- Browse to where you cloned the initial project generated from Spring Initializr
### Adding New Libraries/Dependencies
- Always add new libraries/dependencies via ```build.gradle```
- Look for possible examples on Spring Initializr and add when generating project.
- Look at list of [Starters](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#using.build-systems.starters) that Spring Boot provides. 

## MySQL
Open-source relational database with a tool suite.
### Installation
- [Download and Install](https://dev.mysql.com/downloads/mysql/)  
- [Download and Install MySQL Workbench](https://dev.mysql.com/downloads/workbench/) if not already installed from previous download.
- Start the MySQL DB
- Connect to local MySQL DB from MySQL Workbench
- At the prompt, enter ```CREATE DATABASE <db_name>;``` then hit the lightning button after typing to execute.
- In Spring application, modify ```apllication.properties``` to include:
  ```
  spring.jpa.hibernate.ddl-auto=create-drop
  spring.datasource.url=jdbc:mysql://${MYSQL_HOST:localhost}:3306/<db_name>
  spring.datasource.username=root
  spring.datasource.password=<your_password>
  spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
  spring.jpa.show-sql=true
  spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
  spring.jpa.database=mysql
  spring.jpa.generate-ddl=true
  logging.level.org.hibernate.SQL=DEBUG
  logging.level.org.hibernate.type=TRACE
  ```
### Documentation
[MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)

## Development Technologies
### Testing
Testing frameworks exist to create automated unit and integration tests to validate functionality of software.
#### Objectives
- Create a unit test for a class in Spring application; use an ```Assert```
- Create a mock object to test on
  - Write a JUnit test for the mock object (fail and succeed at least once)
- Write JUnit tests for implemented features in your project
  - This will occur continuously over the tech bootcamp
#### Testing Resources
##### JUnit
[JUnit Tutorial](https://www.vogella.com/tutorials/JUnit/article.html)  
[JUnit Docs](https://github.com/junit-team/junit4/wiki)
#### Mocking
Mock objects are useful when real objects are impractical or impossible to incorporate into unit tests, like when it has the following properties:
- Non-deterministic results (e.g., returns current time or temperature)
- Has states that are difficult to create or reproduce (e.g., error states)
- Is slow (e.g., a complex database request)
- Does not yet exist or may change
- Would have to include infor and methods exclusively for testing
##### Mockito
[Install using Gradle instructions](https://site.mockito.org/)  
[Mockito Tutorial](https://www.vogella.com/tutorials/Mockito/article.html)  

### Logging
Useful for debugging and supporting applications, however, *useful* logging must be implemented. In a Spring Boot application, Logback is the default implementation. It is included in ```spring-boot-starter-web``` or can be added with ```spring-boot-starter-logging```
#### Objectives
- Log to a file at varying logging levels
- Configure to only log ```ERROR``` level messages
#### Logging References
[Spring Boot - Logging Features](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#features.logging)  
[Spring Boot - How to Use Logging](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#howto.logging)  
[Logback Documentation](https://logback.qos.ch/documentation.html)  

---
# Lab 2 - Database Systems
## Objectives
- Create database schema and populate it with data
- Create and run SQL queries
  - Create Schema
  - Create Table (two tables will be needed for a join)
  - Simple ```SELECT``` statement
  - ```SELECT``` with a ```JOIN```
  - ```INSERT``` statement
  - ```UPDATE``` statement
  - ```DELETE``` statement
## The Relational Model
[Relationa; Database Overview](https://docs.oracle.com/javase/tutorial/jdbc/overview/database.html)
## Tutorials
[PostgresSQL 9.3 Tutorial](https://www.postgresql.org/docs/9.3/tutorial.html)  
[MySQL 8.0 Tutorial, Chapter 3](https://dev.mysql.com/doc/refman/8.0/en/tutorial.html)
## SQL
SQL (Structured Query Language) is a programming language used to communicate with relational databases. SQL provides the ability to retrieve, update, add, and remove data from a database.
### SQL Docs
[SQL Tutorial](https://www.tutorialspoint.com/sql/sql_tutorial.pdf)

---
# Lab 3 - Spring
Open-source application framework with many extensions tailored for building web applications.
[Spring Framework Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/)
## Objectives
- Understand Spring Bean usage
- Use Spring Boot to integrate Spring MVC/REST into project
  - Discover IoC and the container
  - Create a Spring ```@RestController``` that returns some sample JSON data
- **Extra Credit:** Use AOP to log the amount of time each controller request takes
## Inversion of Control
Spring uses an Inversion of Control (IoC) container to configure application components and life-cycle management, mainly done via dependency injection and reflection.
### Tutorial / Documentation
[Introduction to the Spring IoC Container and Beans](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans)  
[Spring's Dependency Injection Container](https://www.marcobehler.com/guides/spring-framework#spring-ioc-dependency-container)
## REST and MVC
Spring implements a Model View Controller framework suitable for creating web applications.
### Tutorial
[Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)  
[Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
### Reference Documentation
[Spring Web MVC](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc)  
[View Technologies](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-view)  
[Common Application Properties](https://docs.spring.io/spring-boot/docs/current/reference/html/application-properties.html)
## Spring JDBC
Spring has additonal abstraction on top of JDBC that simplifies setup and usage.
[Data Access with JDBC](https://docs.spring.io/spring-framework/docs/current/reference/html/data-access.html#jdbc)  
[Introduction to Spring Data JDBC](https://www.baeldung.com/spring-data-jdbc-intro)  
[JDBC Query Methods](https://docs.spring.io/spring-data/jdbc/docs/current/reference/html/#jdbc.query-methods)







