# Tech Bootcamp - Perficient
## Table of Contents
- [Lab 1 - The Development Environment](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#lab-1---the-development-environment)
  - [Objectives](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#objectives)
  - [Java](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#java)  
  - [Gradle](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#gradle)
  - [Git](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#git)
  - [Spring Boot](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#spring-boot)
  - [Spring Tool Suite](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#spring-tool-suite)
  - [MySQL](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#mysql)
  - [Development Technologies](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#development-technologies)
- [Lab 2 - Database Systems](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#lab-2---database-systems)
  - [Objectives](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#objectives-3)
  - [The Relational Model](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#the-relational-model)
  - [SQL](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#sql)
- [Lab 3 - Spring](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#lab-3---spring)
  - [Objectives](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#objectives-4)
  - [Inversion of Control (IoC)](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#inversion-of-control)
  - [REST and MVC](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#rest-and-mvc)
  - [Spring JDBC](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#spring-jdbc)
- [Lab 4 - Object Relational Mapping (ORM) with JPA (Hibernate)](https://github.com/yanesanchez/tech-bootcamp-perficient#lab-4---object-relational-mapping-orm-with-jpa-hibernate)
  - [Objectives](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#objectives-5)
  - [Hibernate](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#hibernate)
  - [Documentation and Tutorials](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#documentation-and-tutorials)
    - [Configuration](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#configuration-1)
    - [Reference](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#reference-check-for-latest-stable-version)
  - [Spring Transaction Management](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#spring-transaction-management)
    - [Reference Documentation](https://github.com/yanesanchez/tech-bootcamp-perficient/blob/main/README.md#reference-documentation-1)
- [Lab 5 - UI/UX]()
  - [HTML]()
  - [JavaScript (ECMAScript)]()
    - [Understanding JavaScript]()
    - [jQuery]()
    - [Ajax]()
  - [CSS]()
- [Glossary]()

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
- In Spring application, modify ```application.properties``` to include:
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
[Relational Database Overview](https://docs.oracle.com/javase/tutorial/jdbc/overview/database.html)
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
- **Extra Credit:** 
  - Use AOP to log the amount of time each controller request takes
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

---
# Lab 4 - Object Relational Mapping (ORM) with JPA (Hibernate)
## Objectives
- Enable JPA via Spring configuration - leveraging Spring Data JPA 
- Create parent level entity for database table (ex: 'Subsidiary Company')
- Create child level entity for database table that uses foreign key from parent (ex: 'Employee')
- Setup O/R Mapping for entities
- Create a DAO
- Include a collection mapping
  - One to many (ex: 'Subsidiary Company' would have many 'Employee's)
- Create an HQL query in the DAO implementation class
- **Extra Credit:**
  - Create third entity (ex: 'Parent Company')
  - Include an association mapping
    - Many to one (ex: 'Subsidiary Company' to 'Parent Company')  

Modify ```application.properties``` to auto-create tables (will drop data and recreate schema on each application restart)
  ```
  spring.jpa.hibernate.ddl-auto=create-drop
  spring.datasource.url=jdbc:mysql://${MYSQL_HOST:localhost}:3306/db_example
  spring.datasource.username=root
  spring.datasource.password=
  spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
  spring.jpa.show-sql=true
  spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
  spring.jpa.database=mysql
  spring.jpa.generate-ddl=true
  logging.level.org.hibernate.SQL=DEBUG
  logging.level.org.hibernate.type=TRACE
  ```
## Hibernate
Hibernate is an open-source, Java based ORM (Object/Relational Mapping) toolkit.  
- Hibernate handles the mapping from Java classes to database tables (to avoid manual data handling), and from Java data types to SQL data types. It also provides querying functionality.  
- There are multiple mechanisms to leverage an ORM, specifically Hibernate, in your application due to how the product and Java standard (JPA) evolved over time.  
- We will be leveraging Hibernate's JPA implementation wired via Spring annotation and context scanning. Doing so eliminates the need for ANY ```persitence.xml``` or xml-based contructs.  
- The only thing needed will be the annotated classes.

### Documentation and Tutorials
#### Configuration
[A Guide to JPA with Spring](https://www.baeldung.com/the-persistence-layer-with-spring-and-jpa) (context config example)  
[Object Relational Mapping (ORM) Data Access](https://docs.spring.io/spring-framework/docs/current/reference/html/data-access.html#orm)

#### Reference (check for latest stable version)
- [Hibernate ORM Documentation - 6.1](https://hibernate.org/orm/documentation/6.1/)
- ~~[Hibernate ORM 5.5.9 Final User Guide](https://docs.jboss.org/hibernate/orm/5.5/userguide/html_single/Hibernate_User_Guide.html)~~
- [Hibernate ORM 6.1.0 Final User Guide](https://docs.jboss.org/hibernate/orm/current/userguide/html_single/Hibernate_User_Guide.html)
  - Key Sections:
    - Domain Model > 2.1-2.6 [(Basic O/R Mapping)](https://docs.jboss.org/hibernate/orm/4.3/manual/en-US/html/ch05.html)
    - Domain Model > [Collection Mapping](https://docs.jboss.org/hibernate/orm/4.3/manual/en-US/html/ch07.html)
    - Domain Model > [Association Mappings](https://docs.jboss.org/hibernate/orm/4.3/manual/en-US/html/ch08.html)
    - [HQL: Hibernate Query Language](https://docs.jboss.org/hibernate/orm/4.3/manual/en-US/html/ch16.html)
  - Also read about schema generation. Hibernate can generate the entire schema for you.  

[Getting Started with Hibernate](https://www.infoworld.com/article/2072999/get-started-with-hibernate.html)  
[Generic DAO with Hibernate and Spring](https://developer.ibm.com/tutorials/j-genericdao/)  

[Transaction Propagation and Isolation in Spring @Transactional | Baeldung](https://www.baeldung.com/spring-transactional-propagation-isolation)  
[One-to-One Relationship with JPA | Baeldung](https://www.baeldung.com/jpa-one-to-one)  
[Hibernate One-to-Many Annotation Tutorial | Baeldung](https://www.baeldung.com/hibernate-one-to-many)  
[Hibernate Many-to-Many Annotation Tutorial | Baeldung](https://www.baeldung.com/hibernate-many-to-many)  
[Transactions with Spring and JPA | Baeldung](https://www.baeldung.com/transaction-configuration-with-jpa-and-spring)  
[Transaction Propagation and Isolation in Spring @Transactional | Baeldung](https://www.baeldung.com/spring-transactional-propagation-isolation)

*Download - use MAVEN instead*  
[Hibernate ORM Releases](https://hibernate.org/orm/releases/)

## Spring Transaction Management
Spring provides a transaction manager for applications which is responsible for coordinating transactions of one or more resources with the database. It provides a consistent programming model across different transaction APIs (JTA, JDBC, Hibernate, JPA, JDO).

### Reference Documentation
READ THIS CHAPTER:  
[Spring Framework - Transaction Management](https://docs.spring.io/spring-framework/docs/current/reference/html/data-access.html#transaction)

---
# Lab 5 - UI/UX
## HTML
HTML (HyperText Markup Language) is the layout and structure of a web page.
```
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>

<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>
```
Styling and functionality can be added with CSS and JavaScript, respectively.
### Objectives
- Create a basic HTML page to display content and a form
- Connect your HTML to a CSS file and a JavaScript file.
### References
[MDN Web Docs - HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)

## JavaScript (ECMAScript)
Used to enhance User Experience online with client executed code. Implemented in all major browsers (although with different levels of support, and each with their own quirks).
### Objectives
- **POST**
  - Create a FORM to POST data to the application for storage in the DB
  - Utilize JavaScript to validate form data before post
    - Hint: use jQuery to attach to the submit event
    - Spring validators
- **GET**
  - Implement a controller method that returns JSON data
  - Call controller method using Ajax (jQuery)
  - Update page based on response via JavaScript/jQuery

### Understanding JavaScript
- Online Articles / Guides
  - [Understanding JavaScript Function Invocation and "this"](https://yehudakatz.com/2011/08/11/understanding-javascript-function-invocation-and-this/)
  - [Common JavaScript Gotchas](http://www.jblotus.com/2013/01/13/common-javascript-gotchas/)
  - [Preparing Yourself for Modern JavaScript Development](https://www.simplethread.com/preparing-yourself-for-modern-javascript-development/)
  - [Prototypes and Inheritance in JavaScript](https://docs.microsoft.com/en-us/previous-versions/msdn10/ff852808(v=msdn.10))
  - [Style Guide: A Mostly Reasonable Approach to JavaScript](https://github.com/airbnb/javascript)
- Books
  - [*Eloquent JavaScript* by Marijn Haverbeke](https://eloquentjavascript.net/2nd_edition/)
    - [Third Edition](https://eloquentjavascript.net/)
  - [*Effective JavaScript* by David Herman]()

### jQuery
Cross platform JavaScript library with functions focusing on client-side scripting of HTML. Versions 1.x.x provide support for Internet Explorer 8, Versions 2.x.x support only **modern** browsers (no <IE8 support).  

[Tutorials](https://learn.jquery.com/)  
[Documentation](https://api.jquery.com/)

### Ajax
Web development techniques that leverage JavaScript, HTML, and CSS to create dynamic and interactive web pages.

[jQuery Ajax tutorial](https://learn.jquery.com/ajax/)

## CSS
CSS (Cascading Style Sheets) is used to style web page content. There are many standard versions of CSS with varying levels of browser support.
### Objectives
- Utilize CSS to improve UX.
  - Modify an element based on Id
  - Modify an element based on class
  - Modify an element based on nested selectors
  - Create 2 different style sheets for theming
### Tutorials
[MDN - Getting Started with CSS](https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps)

---
# Glossary
EAR - Enterprise ARchive  
IDE - Integrated Development Environment  
JDK - Java Development Kit  
JAR - Java ARchive  
WAR - Web application ARchive  
JSP - Java Servlet Pages  
JSTL - JSP Standard Tag Library  
MVC - Model View Controller  
ORM - Object/Relational Mapping  
JDBC - Java Database Connectivity  
JTA - Java Transaction API  
JPA - Java Persistence API  
JDO - Java Data Objects  

