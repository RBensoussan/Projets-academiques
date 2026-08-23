libname project '/home/u63757485/Project';


/* Save an existing dataset to a specific file using a data step */
data '/home/u63757485/Project';
set '/home/u63757485/Project/project2024.sas7bdat';
run;
/* Valid one */

/* Either look at the number of lines in the table or do the following */

/* Q1 : Total number of municipalities */
/* Display the total number of municipalities */
proc print data= project.project2024;
    var commune_id;
run;

/* Q2 : create a database called sample  */
data project.sample;
    set project.project2024;
run;

data '/home/u63757485/Project';
set '/home/u63757485/Project/sample.sas7bdat';
run;

/* Q2.a : Rename variables*/
data project.sample(rename=(collabospc=lncollab verdun_petain=petain pop1911=pop vsleft1914=vsL vsright1914=vsR vsother1914=vsO));
    set project.sample;
run;

/* Q2.b : Create the variable "lnpop" */
data project.sample;
set project.sample;
lnpop=log(pop);
run;

/* Q2.c : Create a dummy variable called "surfdum" */

proc means data=project.sample mean noprint;
    var surface;
    output out=avg_surface mean=avg_surface; /* Average surface is 1528.12 */
   drop avg_surface; /* Drop avg_surface variable as it's no longer needed */ 
run;

data project.sample;
    set project.sample;

    /* Create surfdum variable */
    if surface > 1528.12 then surfdum = 1;
    else surfdum = 0;

run;


/* Q3 : Descriptive statistics */
/* Quantitative variables **/
proc means data = project.sample mean median min max std;                  	
var pop surface vsL vsR vsO lncollab; 	
run;

/* Qualitative variables **/
proc freq data = project.sample;
tables verdun petain dept_code;  									
run;


/* Q5 : Model M1 */
proc reg data = project.sample;
model lncollab = petain;
run; 
quit;

/* Q7 : Model M2 */
proc reg data = project.sample;
model lncollab = petain verdun vsL vsR lnpop;
run; 
quit;

/* Q11 : Adapted model M2 */

/* Creation of the new variables */
/* Each variable is the variable from regular model M2 times the dummy variable surfdum */
data project.sample;
    set project.sample;
    PetainDum = petain*surfdum;
    VerDum = verdun*surfdum;
    VsLDum = vsL*surfdum;
    VsRDum = vsR*surfdum;
    LnPopDum = lnpop*surfdum;

/* Adapted model M2 : we regress the new variables */
proc reg data = project.sample;
model lncollab = PetainDum VerDum VsLDum VsRDum LnPopDum;
run; 
quit;



/* Q12 : Model M3 */

/* Determine the number of colums of the vector D*/
proc sql noprint;
    /* Count the number of unique departments */
    select count(distinct dept_code) into :K
    from project.sample;
quit;

%put Number of columns K: &K;

/* Creation of the dummy variable D */
data project.sample;
    set project.sample;

    /* Create dummy variable D */
    if dept_code = 31 then D = 1;
    else D = 0;

run;

/* Regression of the model M3 */
proc glm data = project.sample;
model lncollab = petain verdun vsL vsR lnpop D;
run; 
quit;

/* Normality test */
/* 1. Run the regression and save the residuals in a new dataset */
proc reg data=project.sample;
    model lncollab = petain verdun vsL vsR lnpop;
    output out=model_results r=residu; /* 'r' saves the residuals as a variable named 'residu' */
run;
quit;

/* 2. Conduct the Normality Tests */
proc univariate data=model_results normal;
    var residu;
    histogram residu / normal; /* Visual check: overlays a normal curve on the residual histogram */
    probplot residu / normal(mu=est sigma=est); /* Q-Q plot for visual normality assessment */
    title "Residual Normality Analysis: Jarque-Bera & Shapiro-Wilk";
run;

/* Heteroscedasticity test */
proc reg data=project.sample;
    /* Estimating the refined model M2 */
    model lncollab = petain verdun vsL vsR lnpop / spec;
    title "Model M2: Diagnostic for Heteroscedasticity (White Test)";
run;
quit;


/* Model M2 with White-Consistent (Robust) Standard Errors */
proc reg data=project.sample;
    /* The 'hcc' option provides heteroscedasticity-consistent covariance estimates */
    model lncollab = petain verdun vsL vsR lnpop / hcc;
    title "Model M2: OLS with Heteroscedasticity-Robust Standard Errors (HCCME)";
run;
quit;


/* Multicollinearity Analysis for Model M2 */
proc reg data=project.sample;
    model lncollab = petain verdun vsL vsR lnpop / vif;
    title "Model M2: Collinearity Diagnostic using VIF";
run;
quit;

/* 2SLS Estimation to Correct for Endogeneity of 'petain' */
/* 2SLS Estimation (Conceptual Script) */
proc syslin 2sls data=project.sample;
    endo petain; 
    instruments [InstrumentName] verdun vsL vsR lnpop; 
    model lncollab = petain verdun vsL vsR lnpop;
    title "Model M2: Correcting for Endogeneity via 2SLS";
run;
