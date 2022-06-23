package com.perficient.techbootcampyanelitutorial;

public class Calculator {
	public Calculator() {
		super();
	}
	
	// example method from https://www.vogella.com/tutorials/JUnit/article.html
	public int multiply(int a, int b) {
        return a * b;
    }

	// example method from https://github.com/junit-team/junit4/wiki/Getting-started
	public int evaluate(String expression) {
	    int sum = 0;
	    for (String summand: expression.split("\\+"))
	      sum += Integer.valueOf(summand);
	    return sum;
	  }
}
