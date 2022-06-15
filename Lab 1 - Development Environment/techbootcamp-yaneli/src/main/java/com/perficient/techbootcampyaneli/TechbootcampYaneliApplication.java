package com.perficient.techbootcampyaneli;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

/* Notes:
 * @RestController and @RequestMapping are Spring MVC annotations.
 * After running as Spring Boot App, go to localhost:8080 in browser
 */

@RestController
@SpringBootApplication
public class TechbootcampYaneliApplication {

	/* provides "routing" information
	 * tells Spring that any HTTP request with the / path should be mapped to this method
	 * the @RestController above tells Spring to render resulting string back to caller
	 */
	@RequestMapping("/")
	String home() {
		return "Hello World!";
	}
	
	public static void main(String[] args) {
		SpringApplication.run(TechbootcampYaneliApplication.class, args);
	}

}
