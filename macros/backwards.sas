/*|----------------------------------------------------------------------------------------------------|*/
/*| BACKWARDS                                                                                          |*/
/*|                                                                                                    |*/
/*| Backwards macro reads a data set from bottom to top. Good for reading ordered tables getting       |*/
/*| the last records first.                                                                            |*/
/*|                                                                                                    |*/
/*| From SAS doc, do not use WHERE or BY statements when modifying the code In adition, do not         |*/
/*| use WHERE= in the SET option, see more at:                                                         |*/
/*| http://support.sas.com/documentation/cdl/en/lrdict/64316/HTML/default/viewer.htm#a000173782.htm    |*/
/*|                                                                                                    |*/
/*| Using the macro:                                                                                   |*/
/*|  INPUT_TABLE: source of records to be read by the macro.                                           |*/
/*|  OUTPUT_TABLE: result with the observation read from INPUT_TABLE                                   |*/
/*|  STOP_CONDITION: use this option as a WHERE clause. Specify a rule to stop reading the INPUT       |*/
/*|   table and stop macro's execution.                                                                |*/
/*|  IN_OPT: options to be used in SET statement (obs: do not use WHERE=)                              |*/
/*|  OUT_OPT: options to be used in DATA statement                                                     |*/
/*|----------------------------------------------------------------------------------------------------|*/
/*| Copyright 2018: Alysson A. Costa                                                                   |*/
/*|                                                                                                    |*/
/*| Permission is hereby granted, free of charge, to any person obtaining a copy of this software      |*/
/*|  and associated documentation files (the "Software"), to deal in the Software without restriction, |*/
/*|  including without limitation the rights to use, copy, modify, merge, publish, distribute,         |*/
/*|  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is     |*/
/*|  furnished to do so, subject to the following condition                                            |*/
/*|                                                                                                    |*/
/*| The above copyright notice and this permission notice shall be included in all copies or           |*/
/*|  substantial portions of the Softwar                                                               |*/
/*|                                                                                                    |*/
/*| THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING      |*/
/*|  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND        |*/
/*|  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,      |*/
/*|  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,    |*/
/*|  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.           |*/
/*|----------------------------------------------------------------------------------------------------|*/
%macro backwards(INPUT_TABLE=, OUTPUT_TABLE=, STOP_CONDITION = FALSE, IN_OPT=, OUT_OPT=);

    PROC SQL; SELECT count(*) FORMAT=best32. INTO :QOBS FROM &INPUT_TABLE. ;QUIT;

    DATA &OUTPUT_TABLE. (&OUT_OPT.);
       do k = &QOBS. to 1 by -1;
          SET &INPUT_TABLE. (&IN_OPT.) point=k ;
          %if (%LENGTH(&STOP_CONDITION.) > O) %then %do; 
             if(&STOP_CONDITION.) then stop;
          %end;
          output;
       end;
       stop;
    RUN;

%mend backwards;
 %backwards(
     INPUT_TABLE   = 
    ,OUTPUT_TABLE  = 
    ,STOP_CONDITION = 
    ,IN_OPT  = 
    ,OUT_OPT = );
