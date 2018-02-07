## Referencing files and setting options

1. Define new libraries by using SAS statements
2. Referencing SAS files in SAS sessions
3. Set system options

### Referencing files in SAS libraries
* Assign a libref (library reference) to SAS libraries
	* LIBNAME statement: **LIBNAME libref [engine] 'SAS-data-library';**
	* Libref will be the first element of a tow-level name
	* Global effect, lasts until the end of the SAS session
	* To reference files created with other software products, it's needed to specify an engine

Example:
```
LIBNAME MYLIB 'path/to/library';
```

### Viewing the contents of SAS libraries
Both procedures produce the same result
* PROC CONTENTS: 
	* Appending \_ALL_ to a libref will list all its files
	* NODS option will suppress detailed information
	* VARNUM option will display variables list in order of creation, replacing the default alphabetical variable order

* PROC DATASETS:
	* CONTENTS statement
		* \_ALL_, NODS and VARNUM options available

Examples:
```
PROC CONTENTS DATA=SASHELP.\_ALL_ NODS; RUN;

PROC CONTENTS DATA=SASHELP.AIR VARNUM; RUN;

PROC DATASETS; 
	CONTENTS DATA=SASHELP.\_ALL_ NODS; 
QUIT;
```

### Setting SAS system options
* Control the appearance of SAS outputs
* OPTIONS statement overrides default system values
	* The statement can be used anywhere in SAS codes
	* Global effect, lasts until the end of the SAS session

#### Some SAS options
VALUES |DESCRIPTION
---|---
DATE / NODATE | Prints the date and time that a SAS program started.
NUMBER / NONUMBER | Prints the page number on the first title line of each page of SAS output.
PAGESIZE | Specifies the number of lines that compose a page of the SAS log and SAS output.
LINESIZE | Specifies the line size for the SAS log and for SAS procedure output for the LISTING destination.
PAGENO | Resets the SAS output page number.
YEARCUTOFF | Specifies the first year of a 100-year span that is used by date informats and functions to read a two-digit year.
FIRSTOBS | Specifies the observation number or external file record that SAS processes first.
OBS | Specifies the observation that is used to determine the last observation to process, or specifies the last record to process.

#### YEARCUTOFF
Used to deal with two-digit year values. The two-digit year in dates will always be in the 100-years span that follows the YEARCUTOFF option, as below:

* YEARCUTOFF=1920
Date Expression | Interpreted As
---|---
12/07/41 | 12/07/1941
18Dec15 | 18Dec2015
04/15/30 | 04/15/1930
15Apr95 | 15Apr1995

* YEARCUTOFF=1950
Date Expression | Interpreted As
---|---
12/07/41 | 12/07/2041
18Dec15 | 18Dec2015
04/15/30 | 04/15/2030
15Apr95 | 15Apr1995

### Viewing SAS system options
* PROC OPTIONS
	* Show all system options
	* It's possible to specify an specific option with OPTION statement

Exemple:
```
PROC OPTIONS;RUN;

PROC OPTIONS OPTION=DATE|PAGESIZE|PAGENO|...;RUN;
```