package com.perficient.techbootcampyanelitutorial;

import org.springframework.boot.test.context.SpringBootTest;

import com.perficient.techbootcampyanelitutorial.Calculator;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;

/* Resource Links
 * 
 * Assertions & Assumptions
 * https://www.vogella.com/tutorials/JUnit/article.html#assertions-and-assumptions
 * Exercise: Writing a JUnit test with Gradle and Eclipse
 * https://www.vogella.com/tutorials/JUnit/article.html#junitgradleeclipse
 * 
 */

@SpringBootTest
public class CalculatorTest {
	// code from https://www.vogella.com/tutorials/JUnit/article.html
	Calculator calculator;

	// run before each @Test
    @BeforeEach                                 
    void setUp() {
        calculator = new Calculator();
    }
    
    // define name of test; displayed to user
    @DisplayName("Simple multiplication should work")   
    void testMultiply() {
    	// validate that the expected and actual values are the same
        assertEquals(20, calculator.multiply(4, 5),     
                "Regular multiplication should work");  
    }

    @RepeatedTest(5)                                    
    @DisplayName("Ensure correct handling of zero")
    void testMultiplyWithZero() {
        assertEquals(0, calculator.multiply(0, 5), "Multiple with zero should be zero");
        assertEquals(0, calculator.multiply(5, 0), "Multiple with zero should be zero");
    }
	
	// test case from https://github.com/junit-team/junit4/wiki/Getting-started
	@Test
	 public void evaluatesExpression() {
	   Calculator calculator = new Calculator();
	   int sum = calculator.evaluate("1+2+3");
	   assertEquals(6, sum);
	 }
}
