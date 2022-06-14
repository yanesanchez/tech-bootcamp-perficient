package com.perficient.techbootcampyaneli;

import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;

@SpringBootTest
public class CalculatorTest {
	// code from https://www.vogella.com/tutorials/JUnit/article.html
	Calculator calculator;

    @BeforeEach                                         
    void setUp() {
        calculator = new Calculator();
    }

    @Test                                               
    @DisplayName("Simple multiplication should work")   
    void testMultiply() {
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
