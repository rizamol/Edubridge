/* Crimes in India  */


/* Create a crime data set from corruption file */

Data Crimes; 
infile "Corruption2019.csv" dlm=',' firstobs= 2 dsd;
input Category$ State$ Pending ReportedCases Reopenedcases StateTransfered Withdrawnbygov Finalreported
			Chargesheet PendingatEnd Totalcases;
run;
proc print data=Crimes;
run;


/* To check the datatype*/
proc contents data=Crimes;
run;

/* To check is there any missing values present in table*/
proc means data=Crimes nmiss;
run;

/* To check the summary  of the data*/
proc summary data=Crimes print n mean median  mode stddev min max;
var Pending ReportedCases StateTransfered Withdrawnbygov Finalreported
			Chargesheet PendingatEnd Totalcases;
run;

/* To check the correlation between columns */
proc corr data=Crimes;
run;

/* Create a sql for storing crime details */
proc sql;
create table Crimedetails as
select * from Crimes;
quit;
proc print data= Crimedetails;
run;

/* Select total crime details basis of state   */
proc sql;
select State,Totalcases 
from Crimes
;
quit;


/* Maximum number of cases display */
proc sql;
select State,Totalcases from Crimes order by Totalcases desc
;
quit;

/* Maximum number of pending */
proc sql;
select State,Pending,Totalcases from Crimes order by Pending desc
;
quit;



/* Visualization  */

/* Pie diagram of Diabetic women and Non Diabetic women */
proc sgpie data=Crimes;
pie Category/  datalabelloc=outside; 
run;

/* Histogram of Total cases report basis */

title "Histogram of Crime data";
proc sgplot data= Crimes;
histogram Totalcases;
run;




/* Histogram of Pending cases basis of category */

title "Histogram of Crime data";
proc sgplot data=Crimes;
histogram Pending/group=Category transparency=0.5 scale=count;
density Pending/type=normal group=Category;
run;

/* To plot scatter basis of chargesheet and final report */

proc sgplot data=Crimes;
scatter x= ReportedCases y=Chargesheet;
ellipse x = Finalreported y = Totalcases;
	title 'Scatter plot';
run;

/* Draw a bar plot basis of crime pending cases */

proc sgplot data=Crimes;
	title 'Pending';
	vbar Pending/response = Totalcases group=Pending stat=percent datalabel;
	xaxis display=(nolabel);
	yaxis grid label='Cases';
run;



/* Box plot Total cases */

proc sgplot data=Crimes;
vbox Totalcases/group=State;
run;

/* State Rajasthan report more cases 
Pending cases more found in Rajasthan*/









