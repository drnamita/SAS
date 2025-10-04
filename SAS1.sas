data four;
input months @@;
cards;
2.1 4.4 2.7 32.3 9.9 
9.0 2.0 6.6 3.9 1.6
14.7 9.6 16.7 7.4 8.2
;
run;


libname in '\\Client\G$\My Drive\STA5990Data';

data eight;
set in.p099;
run;

proc print data=eight (obs=10);
title 'Namita';
run;

data seven;
input sbp @@;
cards;
172 148 151 140 108 152 
123 129 133 130 137 116
115 138 142
;
run;


Proc print data=seven;
title 'Namita';
run;

proc means data=seven n mean std;
var sbp;
title 'Namita';
run;


proc means data=seven n mean std lclm uclm alpha=0.05;
var sbp;
title 'Namita';
run;

proc ttest data=seven h0=130 alpha=0.05;
title 'Namita';
var sbp;
run;

ods select ttests;
proc ttest data=seven h0=130 alpha=0.05;
var sbp;
title 'Namita';
run;


ods select TTests;
proc ttest data=seven h0=130 alpha=0.01; var sbp; run;

ods select TTests;
proc ttest data=seven ho=130 alpha=0.05 sides=U; var sbp; run;


proc means data=eight n mean std;
var age sbp dbp;
title 'Namita';
run;


proc means data=eight n mean std;
var age sbp dbp;
title 'Namita';
run;


proc means data=eight n mean std lclm uclm alpha=0.01;
var age sbp dbp;
title 'Namita';
run;

proc freq data=eight;
table male*HTN / missing; 
run;




data nine;
r=129; n=250; alpha=0.05; p=r/n; z=probit(1-alpha/2);
*standard error; se=(sqrt(n*p*(1-p)))/n;
*continuity correction; cc=1/(2*n);
LL=p-(z*se+cc);
UL=p+(z*se+cc);
run;

proc print data=nine; 
var p LL UL;
run;	


ods select BinomialTest;
proc freq data=eight;	
tables HTN / binomial(p=0.5);
run;



------------------------------------------------------------------------------ 

libname in '\\Client\G$\My Drive\STA5990Data';
title 'Namita';
data four;
set in.p075;
run;

proc print data=four (obs=10);
run;

PROC IMPORT OUT= WORK.penguin
DATAFILE= "\\Client\G$\My Drive\STA5990Data\penguin.csv"
DBMS=CSV REPLACE; 
GETNAMES=YES; 
DATAROW=2; 
RUN;


Proc print data=penguin (obs=5);
run;


proc contents data=penguin;
    run;
--------------------------------------------------------------------------------------------------

ANOVA:
proc glm data=datasetname;
class varname;
model varname2=varname;
run;

Normality Assumption:
proc mixed data=datasetname;
class varname; 
model varname2=varname / residual;
run;



Variances Assumption:
proc glm data=datasetname;
class varname;
model varname2=varname;
means varname / hovtest=bf; 
run;


Kruskal-Wallis Test:
proc npar1way data=datasetname wilcoxon;
class varname; 
var varname2; 
run;

Post-Hoc Tests:
proc glm data=datasetname;
class varname;
model varname2=varname;
means varname / tukey CLDIFF; 
run;

proc glm data=datasetname;
class varname;
model varname2=varname;
means varname / bon; 
run;

proc npar1way data=datasetname Wilcoxon dscf;
class varname; 
var varname2; 
run;
----------------------------------------------------------------------------- 

Two-Way ANOVA (with interaction):
proc anova data=datasetname;
class varname1 varname2;
model varname3=varname1 varname2 varname1*varname2;
run;

Two-Way ANOVA (without interaction):
proc anova data=datasetname;
class varname1 varname2;
model varname3=varname1 varname2;
run;

Post-Hoc Tests:
proc anova data=datasetname;
class varname1 varname2;
model varname3=varname1 varname2;
means varname / tukey cldiff; 
run;

proc glm data=datasetname;
class varname;
model varname2=varname;
means varname / bon; 
run;

Input statement for categorical data (example):
data hair;
input sex $ color $ number;
cards;
male black 32
male brown 43
male blonde 16
male red 9
female black 55
female brown 65
female blonde 64
female red 16
;
run;

Chi-Square Test for 1xk (uniform):
proc freq data=dataset;
weight count;
table var/chisq;
run;

Chi-Square Test for 1xk (known p):
proc freq data=dataset;
weight count;
table var1*var2/nocum chisq testp=(50 25 10 15);
run;

Chi-Square Test for rxc:
proc freq data=dataset;
weight count;
table var1*var2/nocol norow chisq;
run;

McNemar’s Test for Paired Data:
proc freq data=dataset;
weight count;
table var1*var2/agree;
run;
------------------------------------------------------------------------------------- 
Simple Linear Regression:
proc glm data=dataset;
model y=x;
run;

Simple Linear Regression with Confidence Intervals:
proc glm data=dataset;
model y=x/clparm;
run;

Pearson’s Correlation:
proc corr data=dataset;
var var1 var2;
run;

Scatterplot:
proc sgplot data=dataset noautolegend;
scatter y=var1 x=var2; /* just a scatterplot */
reg y=var1 x=var2; /* scatterplot with reg line */
xaxis label=’labelx’;
yaxis label=’labely’;
run;

Correlation Confidence Interval:
proc corr data=dataset fishers;
var var1 var2;
run;

Shapiro-Wilk’s Test:
proc univariate normal;
var eggs weight;
run;

Spearman’s Correlation:
proc corr data=dataset spearman;
var var1 var2;
run;

Multiple Regression:
proc glm data=dataset;
model y=var1 var2 var3;
run; quit;
The following SAS code may be helpful for this assignment:

Independent t-test:
proc ttest data=datasetname h0=0;
class varname;
var varname2;
run;

Wilcoxon Rank Sum test:
proc npar1way data=datasetname wilcoxon;
class varname; 
var varname2; 
run;

Dependent t-test:
proc ttest data=datasetname;
paired var1*var2;
run;

Wilcoxon Signed Rank test:
data datasetname;
set datasetname;
diff=reported-measured;	
run;
proc univariate data=datasetname;
var diff; 
run;

Title- Namita Mishra

Part 1: Descriptive Statistics
data one;
set sashelp.iris;
run;

data one;
set sashelp.iris;
run;
Proc print data=one;
run;
Proc print data=one(obs=20);
run;
proc means data=one mean std maxdec=2;
var SepalLength;
run;

proc means data=one maxdec=2;
var SepalLength;
run;
proc means data=one mean std maxdec=2;
run;
proc freq data=one;
table species / missing;
proc means data=one mean std maxdec=2;
proc freq data=one;
Proc means data=one mean std maxdec=2;
class species;
var SepalLength;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
run;
proc print data=one;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
proc print data=one;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
run; 
proc print data=one (Obs=100);
run;
proc freq Pct data=one;
table species*SL55 / missing;
run;
proc sgplot data=one;
histogram SepalLength;
run;
proc sgplot data=one;
vbox SepalLength;
run;
proc sgplot data=one;
scatter x = SepalLength y = SepalWidth;
run;
PROC CORR DATA=one; 
VAR SepalLength ; 
WITH SepalWidth;
run;

data exbinom;
binom1 = pdf(‘BINOM’,x,p,n); 
run;
proc print data=exbinom;
run;
data Exbinom;
binom1 = pdf(‘BINOM’,x,p,n); run;
proc print data=exbinom; run;
data exbinom;
binom1 = pdf('BINOM',x,p,n); 
run;
proc print data=exbinom;
run;
data exbinom;
binom1 = pdf('BINOM',20,.85,45);
run;
proc print exbinom;
run;
proc freq data=one;
table species*SL55 / missing;
run;
proc print data=one;
run;
-------------------------------------------------------------------------------------------------------- 

data exbinom;
binom1 = pdf('binom',20,.85,45);
run;
proc print data=exbinom;
run;
data exbinom;
binom1 = cdf('binom',30,.85,45);
run;
proc print data=exbinom;
run;
data exbinom;
binom1 = cdf('binom',35,.85,45)-cdf('binom',30,.85,45);
run;
proc print data=exbinom;
run;
data exbinom;
binom1 = pdf('binom',40,.85,45);
run;
proc print data=exbinom;
run;
data exnorm;
norm1 = probnorm((70-80.5)/9.9);
run;
proc print data=exnorm;
run;
data exnorm;
norm1 = probnorm((85-80.5)/9.9) - probnorm((75-80.5)/9.9);
run;
Proc print data=exnorm;
run;
data exnorm;
norm1 = 1- probnorm((90-80.5)/9.9);
run;
proc print data=exnorm;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
run; 
proc print data=one (Obs=100);
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
run;
proc print data=one;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
proc print data=one;
run;
data one;
set one;
if .< SepalLength < 55 then SL55 = 0;
else if SepalLength > 55 then SL55 = 1;
run; 
proc print data=one (Obs=100);
run;
proc freq Pct data=one;
table species*SL55 / missing;
proc print data=one;
run;

-------------------------------------------------------- 
proc print data=one (obs=10);
run;


proc ttest data=one h0=0;
class diet;
var weightchange;
run;


ods select Equality;
proc ttest data=one h0=0; class diet; var weightchange; 
run;


ods TTest;
proc ttest data=one h0=0 alpha=0.05; 
title 'Namita';
class diet; 
var weightchange; 
run;


ods select ConfLimits;
proc ttest data=one alpha=0.05 h0=0; 
title 'Namita';
class diet; var weightchange; 
run;


ods select ConfLimits;
proc ttest data=twelve ho=0; paired new*old; run;

 Independent t-test: 
proc ttest data=datasetname h0=0; 
class varname; 
var varname2; 
run; 


Wilcoxon Rank Sum test: 
proc npar1way data=datasetname wilcoxon; 
class varname; 
var varname2; 
run; 


Dependent t-test: 
proc ttest data=datasetname; 
paired var1*var2; 
run; 


Wilcoxon Signed Rank test: 
data datasetname; 
set datasetname; 
diff=reported-measured; 
run; 


proc univariate data=datasetname; 
var diff; 

	


