Vishal Patel	vpatel589@csu.fullerton.edu
Assignment:	5: Fractional Calculator
Date:		11/17/2015

Assignment:
	-I implemented my program by taking the users input into a single
		mutable array.  The two types of data input into the 
		mutable array are the FractionalNumberObject (defined in 				FractionalNumberObject.h) and a string
		consisting of the operator that the user chooses to use.
	-The program, after receiving a call from the Equals button click,
		will take the array (initially in-fixed) and create a
		postfix expression.  
	-the postfix array is sent to a method to be solved using a stack,
		which brings us our solution
	-The solution is displayed at the top of the app
	-If the solution or any operand input by the user is undefined, the app
		will display “UNDEF”

Program:
	-When running the app, the top text field is the numerator, and the 
		bottom text field is the denominator
	-input the desired values, and use as a normal calculator.  
	-as more values are input into the calculator, the expression
		is updated into the black field at the top of the app
	-The final result/answer will be posted in the black field in 
		its simplest form

Known Bugs:
	-square root button will do nothing! the reason for this is because it was not
		implemented.  
	-typing in an UNDEF value(0 denominator) will not work if an operator is clicked
		afterwards (display ill show UNDEF as it should.  However, typing in 
		an undefined value and clicking ‘=‘ afterwards will continue as a normal
		operation even though it shouldn’t.  

Not implemented:
	-The +/- button and the squareRoot button were not implemented in 
		my project.  
