## Chapter 3: Editing and debugging SAS programs

1. Enhance the readability of SAS programs
2. Interpret error messages in SAS log
3. Correct errors
4. Resolve common problems

### SAS program layout

* SAS statements are free in format
* Best practices improve readability
	* DATA/PROC steps and RUN/QUIT statements in column one
	* Indent statements within a step
	* Include RUN statement after every DATA/PROC step

![SAS statement](https://raw.githubusercontent.com/nu12/sas/base-programming/base-programming/images/sas_statements.png)

### Interpreting error messages
* Two types: syntax and data errors
* For syntax errors
	* SAS log role
		* Displays the word ERROR
		* Identifies possible location of the error
		* Gives an explanation about the error

![SAS error](https://raw.githubusercontent.com/nu12/sas/base-programming/base-programming/images/sas_error.png)

### Correcting errors
* Modify program or step with syntax error and resubmit
* Don't need to be resubmit error-free program or step 


### Detecting and resolving common problems

Problem | Symptom
---|---
missing RUN statement | "PROC (or DATA) step running" at top of active window
missing semicolon | log message indicating an error in a statement that seems to be valid
unbalanced quotation marks | log message indicating that a text string enclosed in quotation marks has become too long or that a statement is ambiguous
invalid option | log message indicating that an option is invalid or not recognized

### Comments in SAS programs

* Two forms:

```
* First form or inline comment;

/* Second form */
/* This one can have
multiple lines */
```

