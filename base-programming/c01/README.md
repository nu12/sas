## Chapter 1: Basic concepts
1. Structure and components of SAS programs
2. Steps involved in processing SAS programs
3. SAS libraries and SAS files
4. Temporary and permanent SAS libraries
5. Structure and components of SAS data sets

### Components of SAS programs
* Data steps: create or modify data sets
* Proc (procedure) steps: pre-written routines to process, analyze and present data

### Characteristics of SAS programs
* SAS statements
	* Always begin with a SAS keyword  
	* End with semicolon

### Processing SAS programs
* SAS reads SAS statements checking for errors. When it encounters the next SAS statement keyword (DATA, PROC, RUN or QUIT), it executes the previous step before move to the next one
* Each step execution generates an output in the log

### SAS libraries 
* Libraries are collections of SAS files, that con be physically or logically allocated, depending on the OS
* Temporary library: WORK
* Permanent libraries: SASHELP/SASUSER/OTHERS LIBS/...

### Referencing SAS files
* Using two-level names: libref.filename
* Using one-level names: only filename = temporary files located in WORK library
* Naming practices
	* Up to 32 characters long
	* Starts with letter or underscore
	* Followed by any combination of letters, numbers and underscores

### SAS data sets
* Descriptor portion: contains information about the data set
* Data portion:
	* Variables: columns
	* Observations: rows/records

### Variable attributes
* Name, length, type, format, informat,...
* Missing values depend on data type
	* Characters: blank
	* Numbers: period (.)