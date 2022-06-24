package com.perficient.techbootcampyaneli;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;


/* Notes:
 * @RestController and @RequestMapping are Spring MVC annotations.
 * After running as Spring Boot App, go to localhost:8080 in browser
 */

@SpringBootApplication
@EntityScan(basePackages = {"com.perficient.techbootcampyaneli.entity"})
public class TechbootcampYaneliApplication {

	
	
	public static void main(String[] args) {
		SpringApplication.run(TechbootcampYaneliApplication.class, args);
	}

}
