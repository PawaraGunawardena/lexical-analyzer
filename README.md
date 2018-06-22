To use this program you have to follow below steps. 

	1. This is describes the major configurations of the working environment in Windows platforms. To make the environment,
		
		Go to http://www.cygwin.com/, install Cygwin including bison 2.3-1, flex 2.5.4a-3, gcc-core 3.4.4-1, and make 3.81-1. 

	2. After setting up the environemnt now need to clone the repository into new local repository. 
		
		For more information read this link https://help.github.com/articles/cloning-a-repository/
		
	3. Open the cygwin bash shell, which installed under instruction 1.
	
	4. Using bash shell, go to the program source folder which created under instruction 2. For this, use the command "cd path" in the bash shell.

	5. Give the command "make".
	
	6. To do the running of the program, use the command "./comp.exe < input.c" for the first given input program. 
	
		Use the command "./comp.exe < input2.c" to run the second given input program.
		
	7. Do modifications by creating sytax errors in the "input.c" and "input2.c" programs and verify that it gives errors. 
	
		Verify that, when no errors in the input programs it successfully proceeds.