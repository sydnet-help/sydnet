---
title: "Lesson 5: Tools for Data Analysis."
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_05.html
summary: "This week we are going to ..."
---

*Last updated: 20 Aug 2018*

                     
 TITLE: 5. Presenting Results + Mediation
 SOCI832: Advanced Research Methods
 Week 5: Presenting Results (1 of 1 file)
 Author: Nicholas Harrigan
 Last updated: 28 Aug 2018
                     

                         #

 OVERVIEW ----

                          #

Welcome to Week 5 of SOCI832: Advanced 
 Research Methods. This week we are going
 to deal with how to present four types of
 tables: 
   (1) univariate statistics
   (2) bivariate correlations with the dependent
   variables
   (3) regression models
   (4) correlation matrixes, which are normally
   found in a paper's appendix

As we discuss regression models, we will also
 discuss two types of causal path ways which
 can be identified and illustrated with multiple
 regression models: mediation and spuriousness.

                         #

 1. Concepts ----

                          #

- - - - - - - - - - - - - - - - - - - - - - - -
 1.1 Causal Pathways ----
 - - - - - - - - - - - - - - - - - - - - - - - -
 When talking about variables we can think about
 four key pathways through which two or three 
 variables can be related. 
 
 1. Direct effect of A on B (main effect)
 The first is the direct effect on a variable A
 on another variable B. This is what we generally think of
 when we say that A caused B. We can represent this
 diagramatically as:

     A -----> B

Example 1: Samantha's punch (A) causes James's
 nose to bleed (B).
 Example 2: Parents income (A) increases the likelihood
 of a person becoming a medical doctor (B).

2. Indirect effect of A on B through C (mediation)
 The second causal pathway is the indirect effect of
 variable A on B through variable C. This is what
 we often call a pathway, a mediated relationship, 
 or a mechanism. This can be represented diagramatically
 as:
            C
          /\  \ 
          /    \ 
         /     \/
        A       B

Example 1: Samantha's punch (A) causes James's nose to
 break (C) which causes James's nose to bleed (B).
 Example 2: Parents income (A) increases the likelihood
 of their child attend a private school (C) which increases
 the child's likelihood of becoming a medical doctor (B).

3. Effect of A on B, moderated by C (moderation)
 The third causal pathway is moderation. This is the
 interaction effect we learnt about last week. It 
 occurs when a varable C changes the nature of the
 relationship between variables A and B. This can
 be represented diagramatically as:

            C
             ||
             ||
             \/
        A ---------> B

Example 1: When a woman punches a man (A) and
 the woman has great strength (C) the man's nose tends
 to bleed (B).
 Example 2: Parents income (A) combined with a child's motivation
 to study together interact to (C) increase
 the child's likelihood of becoming a medical doctor (B).
#
 4. Effect of C on both A and B (spuriousness)
 The fourth causal pathway is spuriousness. This occurs
 when there is a correlation between A and B, but it is
 not causal. Instead, the correlation between A and B
 is caused by a third variable C. Variable C causes
 both A and B. This can be represented diagramatically as:

           C
          / \
         /   \
        \/   \/
        A     B

 Example 1: When people get angry (C), they tend to punch things (A)
 and their blood pressure rises, leading to nose bleeds (B).
 Example 2: Adults who are ambitious and driven (C) tend to 
 have higher incomes (A) and children who are medical doctors (B).

 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 1.2 Standard Tables ----
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 In this section we will learn about how to generate,
 export, and present the key tables of a quantitative
 academic paper. I'll review the key concepts and
 principles, and then I'll present the relevant
 R-code.
 
 - - - - - - - - - - - - - - - - - - - - - - - -
 1.2.1 Types of Tables ----
 - - - - - - - - - - - - - - - - - - - - - - - -
 Quantitative academic papers tend to follow 
 a standard format. While you don't need to
 follow this standard format, it is important
 that you are conscious of the general expectations.

 The standard format for most quantitative papers, 
 particularly those with regression models, is:
 1. Univariate statistics table: A table of
 the mean, standard deviation, min, max, 
 and number of valid (i.e. not missing) cases
 for all variables in the paper.
 2. Bivariate statistics table: A table
 showing the correlation coefficient (or
 similar) for the relationship between the 
 main dependent variable/s and the independent
 variables
 3. Regression model table/s: One or more
 tables that show the regression models. Generally
 there will be three or four regression models
 presented, with the first being just the control
 variables, and then key variables will be added
 step-by-step, so as to show how the model 
 improves/changes as variables are included. 
 4. Correlation matrix in appendix: This is 
 sometimes done instead of or in addition to 
 the bivariate statistics table. It shows the
 correlation matrix of all variables with 
 all other variables.

- - - - - - - - - - - - - - - - - - - - - - - -
 1.2.2 Purpose of Tables ----
 - - - - - - - - - - - - - - - - - - - - - - - -
 Each of these four tables has a purpose, and
 the purpose comes from the needs and desires
 of the reader.

- - - - - - - - - - - - - - - - - - - - - - - -
 1.2.2.1 Univariate table ----
 The first table, of univariate statistics,
 is an opportunity for your reader to quickly get
 a sense of your data. This is often called the
 'descriptive statistics'. 
 
 For example, you might be writing a paper on
 the effect of working hours and monthly salary
 on levels of depression amongst Australians.
 Your table will looks something like this:

- - - - - - - - - - - - - - - - - - - - - -
 | Variable | Mean | SD | Min | Max |  n   |
 - - - - - - - - - - - - - - - - - - - - - -
 | hours    |  42  |  7 |  0  | 120 | 1992 |
 | salary   |  50  | 22 |  5  | 500 | 1835 |
 | depress  |   4  |  3 |  0  |  24 | 1695 |
 - - - - - - - - - - - - - - - - - - - - - -

While your later tables - that show correlation 
 with DV, regression, and correlation matrix -
 show the relationships BETWEEN variables, only
 the univariate statistics table, with the means, 
 standard deviations, min, max, and number of cases
 of each variable allows the reader to quickly get
 a sense of the answer to basic questions like:
 * What are the average working hours of Australians?
 * How much does this vary across people in the sample?
 * What is the average salary? 
 * What is the average, min, and maximum level of 
 depression in the sample?

As you can see, these are very interesting and
 important questions if you - as the reader - 
 are (1) trying to interpret the models later
 in the paper; and (2) understand what the data
 says about the real world. 

- - - - - - - - - - - - - - - - - - - - - - - -
 1.2.2.2 Correlation Table ----
 The second standard table in most quantitative 
 academic papers - particularly those papers 
 which contain regression models - is a simple
 bivariate correlation table, showing the 
 bivariate correlations of the dependent variable/s
 with the independent variables. 

This table allows the reader to quickly get
 a sense of the INDEPENDENT impact/relationship
 between the independent (predictor) variables
 and the dependent (outcome) variable. 

This is important for two reasons:
 (1) it allows the reader to quickly get an
 idea of which variables are likely to be important
 and those which are not.
 (2) this table allows and justifies the authors (i.e.
 you) choice to drop any variables that are not 
 significant in this table.

It turns out that if your independent variables
 are not significant at the bivariate level they:
 (1) are probably not going to be significant
 in the multivariate model (it would be luck/chance
 if it happened, unless you have some good theoretical
 reason for thinking otherwise); and
 (2) they are better to drop from the regression model
 because they are likely to inflate the standard errors
 of the other variables, leading to high likelihood that
 actually signifiant variables appear as non-significant.

Example of a correlation table showing relationship
 of the dependent variable (depression) and a range
 of independent variables:
    - - - - - - - - - - - 
    |          | depress |
    - - - - - - - - - - - 
    | hours    |  .21**  | 
    | salary   |  .12*   |
    | female   | -.23**  | 
    | age      |  .01    | 
    - - - - - - - - - - -
    Notes: * p < 0.05; ** p < 0.01

- - - - - - - - - - - - - - - - - - - - - - - -
 1.2.2.2 Regression Tables ----
 The regression tables are the core models of your paper.
 There is no need to justify why they are there. They
 are simply the best statistical models of your concepts,
 theories, and data that you have been able to produce. 

But why do we have multiple regression models in the 
 same table? And what variables should we include in
 each of the different regression models?

It's a little hard to give strict rules, but generally
 speaking best practice is to:

  1. Start with just the control variables (such as
   demographic variables like age, gender, etc.) as your
   first model. Why? This shows the baseline model. It
   shows how the controls are acting on their own. The R-squared
   shows how much variance in the dependent variable (outcome)
   is explained by the controls. This is important for
   being able to iterpret the effect size of your key variables. 
   In many papers the control variables explain a large amount
   of the explainable variation - which is fine - but it is
   an important fact to make transparent.

  2. Run your full model minus the key variable you are
   theorising is particularly important. So if you are
   arguing that working hours are particularly important
   in their impact on depression, then run your model with
   everything EXCEPT working hours.

  3. Run your complete full model, WITH your key variable.

This format will allow you to show (1) the improvement in 
 R-square caused by your key variable; and (2) show any 
 relationship between your key variable and other variables
 in the model.

Often adding your key variable to a model will make other
 variables - such as control variables - non-significant. 
 This generally indicates that the key variable plays either (1) a 
 mediating role, lying between the other independent variable
 and the dependent variable; or (2) the key variable is
 the cause of both the dependent and independent variable (in
 which case the previous relationship between the dependent
 and independent variable was spurious).

* * Mediation----
 For example, you may have run your second model of depression
 with everything except working hours in the model, and it 
 might have shown that men were more likely to be depressed than
 women. However, in the third model, you add working hours and
 while working hours are now significant, the effect of being male
 is no longer significant. What does this say? It says that
 it is not being a 'man' per se that makes someone depressed,
 but rather it says that men tend to work longer hours, and 
 those who work longer hours tend to be more depressed. 

I've tried to draw this relationship in Diagram 1 below.
 It is supposed to show arrows, and in the middle of each
 arrow is either a (+) which means positively influences, or
 // which means no effect. 

You can see that being male increases the number of working
 hours a person does, and working longer hours increases
 depression, but there is no direct relationship between
 being male and depression. 
#

 Male ----(+)----> Depression

DIAGRAM 1A: A PATH DIAGRAM OF THE RELATIONSHIP
 BETWEEN GENDER AND DEPRESSION, WITHOUT 
 CONTROLLING FOR WORKING HOURS.

     Working Hours
        ^        \
       /         (+) 
     (+)           \
     /             \/
  Male ----//----> Depression

DIAGRAM 1B: A PATH DIAGRAM OF THE RELATIONSHIP
 BETWEEN GENDER, WORKING HOURS, AND DEPRESSION,
 AFTER INCLUDING WORKING HOURS.
 
 * * Spuriousness ----
 We could also imagine another scenario where we 
 run a regression model and monthly pay is positively
 correlated with depression. It appears that the more
 you are paid, the more depressed you are (see DIAGRAM 2A).
 However, you then control for working hours, and
 find that when you control for working hours, the
 effect of monthly pay is actually reversed - with
 more pay actually lowering - symbolised by the (-) - 
 depression (see DIAGRAM 2B) 
 
 This would likely be an example of spuriousness:
 longer working hours is likely leading to higher pay
 as people do overtime (or higher paid people on salaries
 work more unpaid overtime on average). Spuriousness
 is defined as when a relationship between two variables
 (in this case pay and depression) is caused by a third
 variables (working hour) that is the cause of those two 
 variables.

Monthly Pay ----(+)----> Depression 

DIAGRAM 2A: A PATH DIAGRAM OF THE RELATIONSHIP
 BETWEEN PAY AND DEPRESSION, WITHOUT 
 CONTROLLING FOR WORKING HOURS.

            Working Hours
            /            \
          (+)            (+) 
          /                \
         \/                \/
 Monthly Pay ----(-)----> Depression 
 
 DIAGRAM 1B: A PATH DIAGRAM OF THE RELATIONSHIP
 BETWEEN PAY, WORKING HOURS, AND DEPRESSION,
 AFTER INCLUDING WORKING HOURS.

BUT HOW DO YOU KNOW IF IT IS MEDIATION OR 
 SPURIOUSNESS? 
 When you see these two examples, you probably are 
 thinking "But when this happens to me, how do I know
 if a variable changes because of mediation or 
 spuriousness? 

In a cross-sectional (meaning single timepoint) observational
 (meaning we can't control the application of the independent
 variable) study it can be quite difficult to tell the difference
 between mediation and spuriousness.

The main way we distinguish is by asking if it logically
 or theoretically makes sense for causality to run in one
 or the other direction. 

For example, take the correlation between being male
 and working hours in Diagram 1B. Theoretically that 
 arrow of causality can only go in one direction: 
 from male to working hours. Why? Because no matter
 how many working hours a person does, it is not
 going to change whether they are male or not. So
 we know - from a whole lot of things we know about
 the nature of being male or female - that we can
 safely assume that biological sex is not going to
 be 'caused' by working hours. 
 
 For many other variables, the causal direction of 
 correlations - or the ruling out of certain causal
 directions is a lot harder. For example, long
 working hours might give rise to depression, but depression
 could also give rise to long working hours. 

In cases such as this we generally make assumptions 
 about causal direction, based on our best reasoning
 and then we acknowledge the limitations of such an 
 assumption. 

- - - - - - - - - - - - - - - - - - - - - - - -
 1.2.2.4 Correlation Matrix ----
 Often we include a correlation matrix of all the variables
 correlated against all other variables as a table in the 
 appendix of our paper. 

Why do we do this? It provides the reader and reviewer
 with a simple snap shot of the the relationships amongst
 all the variables. The reader can look for the cultering
 of any variables (a group of variables that are all correlated
 with each other) and also any variables that are highly
 colinear with each other - which can be an indicator that the
 regression model is going to have problems with multi-collinearity. 

For example, a writer might include two variables - working hours
 and hours overtime - as variables in their regression model, but
 when a reader looks at the correlation matrix in the appendix they
 find that these two variables have a correlation of 0.9 and are basically
 measuring the same concept - long working hours - and only one
 off the variables should be included in the model (or you will get
 inflation of standard errors - see Variance Inflation Factor (VIF)
 in Week 3's notes).

Example of a correlation matrix:
 - - - - - - - - - - - - - - - - - - - - 
 |          | hours | salary | depress |
 - - - - - - - - - - - - - - - - - - - - 
 | hours    |   1***|   -    |    -    |
 | salary   |  .32**|   1*** |    -    |
 | depress  |  .21**|  .12*  |    1*** |
 - - - - - - - - - - - - - - - - - - - -
 Notes: * p < 0.05; ** p < 0.01; *** p < 0.001
#

                         #

 2. R-code ----

                          #

- - - - - - - - - - - - - - - - - - - - - - - -
 2.1 Preparing data ----
 - - - - - - - - - - - - - - - - - - - - - - - -

I'm just going to start by preparing the data for the models
 I need to import the data, create my indexes, and rename and
 recode my variables so they are easy to use in tables and 
 models.

 If you are interested, this is the codebook
browseURL("https://mqsociology.github.io/learn-r/soci832/aes_full_codebook.html")

Load dataset
aes_full <- readRDS(gzcon(url("https://mqsociology.github.io/learn-r/soci832/aes_full.rds")))

 I'm going to create an empty dataset with the same number of rows
 as our Australian Electoral Study dataset. I am doing this so
 that I have somehwere to store variables with more user friendly
 names than 'e1'.
df <- aes_full
df[,1:ncol(df)] <- NULL

 This is the normalise function for normalising variables before creating
 an index.
norm <- function(x) {
  y <- (x - mean(x, na.rm = TRUE))/
    sd(x, na.rm = TRUE)
  return(y)
}

 Here I normalise all the variables for my first index, 'Economic Conservative':
aes_full$n_d8p8 <- norm(aes_full$d8p8)
aes_full$n_d8p5 <- norm(aes_full$d8p5)
aes_full$n_d8p3  <- norm(aes_full$d8p3)
aes_full$n_d13p3 <- norm(aes_full$d13p3)
aes_full$n_d13p6 <- norm(aes_full$d13p6)
aes_full$n_d13p4 <- norm(aes_full$d13p4)
aes_full$n_d1health <- norm(aes_full$d1health)

 Here I add them together as index called "Economic Conservative"
 Remember that I would normally test the Cronbach Alpha for these
 variables as an index, to make sure they do make a good index.
df$Economic_Conservative <- (aes_full$n_d8p8 + aes_full$n_d8p5 + 
                               aes_full$n_d8p3 + aes_full$n_d13p3 + 
                               aes_full$n_d13p6 + aes_full$n_d13p4 + 
                               aes_full$n_d1health)

 Now I prepare my variables for the second index, which
 is 'Pro-immigration'. 

 If you remember last week, for this variable, option 4
 was 'I don't know', so we need to recode this as NA.
aes_full$recode_e4 <- car::recode(aes_full$e4, 
                                  "1 = '1'; 2 = '2'; 
                                  3 = '3'; 4 = NA")

 Now we normalise the variables
aes_full$n_recode_e4 <- norm(aes_full$recode_e4)
aes_full$n_e6boats <- norm(aes_full$e6boats)
aes_full$n_e2immig <- norm(aes_full$e2immig)
aes_full$n_e2migeo <- norm(aes_full$e2migeo)
aes_full$n_e6ethnic <- norm(aes_full$e6ethnic)
aes_full$n_e2asia <- norm(aes_full$e2asia)
aes_full$n_f8p1 <- norm(aes_full$f8p1)
aes_full$n_f8p3 <- norm(aes_full$f8p3)

 And create the second index:
df$Pro_Immigrant <- (aes_full$n_e6boats + aes_full$n_e2immig + 
                       aes_full$n_e2migeo + aes_full$n_e6ethnic + 
                       aes_full$n_e2asia + aes_full$n_recode_e4 + 
                       aes_full$n_f8p1 + aes_full$n_f8p3)    

 We now want to make variables in our new dataset (df)
 that will be our independent variables. 
 In some cases, we just copy across the variable (e.g. age)
 In other cases, we dichonomise/dummy the variable which 
 is categorical in the original AES data.
 Age in years:
df$Age <- aes_full$age
 Union member (yes =1, no = 0)
df$Union_Member <- ifelse(aes_full$g6 == 1, 1, 0)
 Born in Australia (yes =1, no = 0)
df$Aust_Born <- ifelse(aes_full$h23own == 1, 1, 0)
 Female (yes = 1; no = 0)
df$Female <- ifelse(aes_full$h1 == 2, 1, 0) 
 Income (in $10k units)
df$Income <- aes_full$h15
 Income security - likert scale, higher is more secure.
df$Income_Security <- aes_full$d11
 Own your own home/business/stock/savings (yes = 1; no = 0)
df$Own_Home <- ifelse(aes_full$h4p1 == 1, 1, 0) 
df$Own_Business <- ifelse(aes_full$h4p2 == 1, 1, 0) 
df$Own_Stocks <- ifelse(aes_full$h4p3 == 1, 1, 0) 
df$Own_Savings <- ifelse(aes_full$h4p4 == 1, 1, 0)
 Years Tertiary Study (0 to 9 years)
df$Years_Tertiary_Study <- aes_full$g2
 Reported having 'no religion' (yes = 1; no = 0)
df$No_Religion <- ifelse(aes_full$h6 == 7, 1, 0)
 Identifies as a Labor Voter (yes = 1; no = 0)
df$Labor <- ifelse(aes_full$b1 == 2, 1, 0)
 Identifies as a Green Voter (yes = 1; no = 0)
df$Green <- ifelse(aes_full$b1 == 4, 1, 0)
 Identifies as a Coalition Voter (yes = 1; no = 0)
df$Coalition <- ifelse(aes_full$b1 == 1 | aes_full$b1 == 3 , 1, 0)

 - - - - - - - - - - - - - - - - - - - - - - - -
 2.2 Univariate Table ----
 - - - - - - - - - - - - - - - - - - - - - - - -
 For each of these tables, we basically need to do four things:
 1. Generate the table in R
 2. Export the table from R (which we will generally do by making a HTML
 webpage table)
 3. Format for publication (which we will generally do by cutting and
 pasting and reformating in Excel)
 4. Paste into our publication/slides (which we will generally do by
 taking a screenshot and pasting into our report or slides)
#

2.2.1 Generate + export: summarytools ----
 This is the method I taught you in week one. However,
 as you will see below, I think stargazer is probably a 
 better method for creating publication quality tables.
install.packages("summarytools")
library(summarytools) 
print(descr(df, 
            omit.headings = TRUE, 
            stats = c("n.valid", "mean", "sd", "min", "max"),
            transpose = TRUE), 
      method = "browser", footnote = NA)

 2.2.2 Generate + export: stargazer ----
install.packages("stargazer")
library(stargazer) 
invisible(capture.output(stargazer(df, type="html", out="desc.htm", summary.stat = c("n", "mean", "sd", "min", "max"))))
browseURL("desc.htm")

 2.2.3 Import into Excel ----
 In the browser that opens, highlight and copy the text.

Then open Excel (or Numbers - in Mac; or Google Sheets) and 
 paste the table into Excel

You can now reformat the table for publication. 

Remember the golden rules for making publication quality
 tables:
   1. Tables and diagrams should be self-contained: there 
   should be enough information in the table for the reader
   to understand the table WITHOUT needing to refer to the text.
   We do this by making sure we properly label columns and rows,
   and statistics, and also have a descriptive title, and notes
   below the table to explain what it is.
   2. Avoid verticle lines: You should generally only have 
   horizontal lines in your tables. Columns should be distinguished
   by the white space between them, not lines. 
   3. Titles of tables go ABOVE the table. Titles of diagrams/
   figures go BELOW the diagram/figure (Why? in a table, the
   first thing you look at is the title; in a diagram the first
   thing you look at is the picture/diagram. Whatever you look at
   first should be at the top of the page.
   4. Do not use bold or underline or italic or different size
   fonts in a table.
   5. Number tables and figures from 1 upwards, with separate numbers
   for tables and figures. So if you have two tables and three figures,
   these will be called Table 1, Table 2, Figure 1, Figure 2, and Figure 3.
   6. For tables that have significance stars (*, **, etc.) the meaning
   of these symbols is indicated with a note at the bottom of the table.
   7. If you are unsure about convention for making tables or figures,
   (1) google it; and (2) look at a table or figure from a recent (last 10
   years), good quality (has an SSCI impact factor) academic journal. 
   Look at what the Chicago Manual of Style and/or Am. Psych Assoc.
   Style Guide

2.2.4 Screenshot ----
 Once you are finished laying out your table, screenshot it
 and paste it into your paper or presentation. 
 In Windows, the screenshot shortcut is Windows+Shift+S, but 
 sometimes you need to open OneNote first. 
 Sometimes the "PrtSc" button also works. 
 
 When taking screenshots of an Excel table it is best to make 'gridlines'
 invisible. This option can be found in the 'View' ribbon, and then
 you untick the 'gridlines' option under the 'show' menu.

 - - - - - - - - - - - - - - - - - - - - - - - -
 2.3 Correlation Table + Matrix ----
 - - - - - - - - - - - - - - - - - - - - - - - -
 To make the correlation table and the correlation
 matrix we are going to use the 'corstars' function
 which we created previously. 
 
 This is the code for this function:

install.packages("Hmisc")
install.packages("xtable")
library(xtable)
library(Hmisc)

corstars <-function(x, method=c("pearson", "spearman"), 
                    removeTriangle=c("upper", "lower"),
                    result=c("none", "html", "latex")){
  require(Hmisc)
  x <- as.matrix(x)
  correlation_matrix<-rcorr(x, type=method[1])
  R <- correlation_matrix$r  Matrix of correlation coeficients
  p <- correlation_matrix$P  Matrix of p-value 
  mystars <- ifelse(p < .0001, "****", ifelse(p < .001, "*** ", ifelse(p < .01, "**  ", ifelse(p < .05, "*   ", "    "))))
  
  R <- format(round(cbind(rep(-1.11, ncol(x)), R), 2))[,-1]
  
  Rnew <- matrix(paste(R, mystars, sep=""), ncol=ncol(x))
  diag(Rnew) <- paste(diag(R), " ", sep="")
  rownames(Rnew) <- colnames(x)
  colnames(Rnew) <- paste(colnames(x), "", sep="")
  
  if(removeTriangle[1]=="upper"){
    Rnew <- as.matrix(Rnew)
    Rnew[upper.tri(Rnew, diag = TRUE)] <- ""
    Rnew <- as.data.frame(Rnew)
  }
  else if(removeTriangle[1]=="lower"){
    Rnew <- as.matrix(Rnew)
    Rnew[lower.tri(Rnew, diag = TRUE)] <- ""
    Rnew <- as.data.frame(Rnew)
  }
  
  Rnew <- cbind(Rnew[1:length(Rnew)-1])
  if (result[1]=="none") return(Rnew)
  else{
    if(result[1]=="html") print(xtable(Rnew), type="html")
    else print(xtable(Rnew), type="latex") 
  }
} 

 To generate the HTML file of the correlation matrix, run this
 code:
x <- print(xtable(corstars(df)), type="html")
dput(x, file = "corr_matrix.html")
browseURL("corr_matrix.html")

 Once you have run this code, you follow the same proceedure
 as with the univariate table - pasting into Excel, formating,
 and then screenshotting.

Remember that you are making two different tables: one for
 the correlation between your dependent variable/s and the 
 independent variables; and one which is a correlation matrix
 of all variables.

If you look at the table I have created for my example dataset
 the first two columns are the two dependent variables, so
 you would just use these first two columns for 'Table 2'.

You would, however, use the entire correlation matrix for the
 table in the appendix.

- - - - - - - - - - - - - - - - - - - - - - - -
 2.4 Regression Table ----
 - - - - - - - - - - - - - - - - - - - - - - - -

In this next section I am going to create a series of models
 where I slowly add variables in theoretically meaningful groups. 

By theoretically meaningful, I mean that I am putting variables
 in at the same time which have similar meaning (e.g. I put
 all the wealth/ownership variables in at one time).

There are two purposes generating these multiple models.
 * First, I just want to show you how to make multiple models
 and then display them for publication in the one table.
 * Second, I want to show you how by running and comparing
 multiple models you can identify direct, mediating and
 spurious causal pathways.
 
 - - - - - - - - - - - - - - - - - - - - - - - -
 2.4.1 Modeling Economic Conservatism ----
 First we run a series of models. I have called them 1a, 1b, etc
 for convenience. You could give them any name:

model.1a <- lm(df$Economic_Conservative ~ df$Age + df$Aust_Born + 
                 df$Female + 
                 df$Union_Member + df$Years_Tertiary_Study)

model.1b <- lm(df$Economic_Conservative ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member + df$Years_Tertiary_Study +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks)

model.1c <- lm(df$Economic_Conservative ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member + df$Years_Tertiary_Study +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income)

model.1d <- lm(df$Economic_Conservative ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member + df$Years_Tertiary_Study +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security)

model.1e <- lm(df$Economic_Conservative ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member + df$Years_Tertiary_Study +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security +
                 df$No_Religion)

model.1f <- lm(df$Economic_Conservative ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member + df$Years_Tertiary_Study +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security +
                 df$No_Religion + 
                 df$Labor + df$Green + df$Coalition)

 We then use stargazer to visualise these models in one table.
 I have used some default settings so at the moment they
 are just reporting the number of cases, the two different
 r-squared values.
invisible(capture.output(stargazer(model.1a, model.1b, model.1c, 
                                   model.1d, model.1e, model.1f,
                                   type="html", 
                                   out="models.1.htm", 
                                   keep.stat=c("n","rsq", "adj.rsq"))))
browseURL("models.1.htm")

 Take a look at the regression models in your browser.
 
 In class we will discuss how to identify direct, mediating, and 
 spurious relationships in a table like this. 

However, some simple rules are these:
 1. Direct causal relationships will stay significant across all 
 your models, since no matter what else you put in the model 
 when there is a direct relationship the independent variable 
 will have an effect on the dependent variable.
 2. Both Spurious and Mediated relationships will show the 
 same pattern in regression models: In a simpler model,
 A will positively correlate with B. However, when you
 add the variable C, C will positively correlate with B and
 A will become non-significant (or less significant or significant
 in the opposite - negative - direction).
 3. When you have cross sectional (single time point) data
 the only way that you can decide if the effect is spurious
 is by using LOGIC/DEDUCTION/THEORY to determine whether
 (1) A must have caused C, (2) C must have cause A, or (3) A and C could be 
 mutually-reinforcing. 

How do you do this? Generally by looking for 1. Time order; and 
 2. Logical impossibilities.

For example, if A is Age and C is Income (and B is economic conservative)
 then clearly income (C) cannot cause age (A). And in addion,
 there are not many things that 'cause' age - except the passing of
 time - so we can be pretty sure that if the addition of income (C)
 changes the coefficient for age (A), then it is because Age (A) 
 has some causal effect on income (C), which then mediates Age's 
 relationship with Economic Conservatism.

In the regression models in your browser, you can see that when we
 add the 'wealth' variables in model 2, Years of Tertiary Study moves
 from being significant and positive in Model 1, to being non significant. 
 However, we can't really use logic or deduction to definitively say 
 if the relationship between tertiary study and economic conservatism
 is mediated by wealth (study -> wealth -> economic conservatism), or
 if wealth (e.g. family wealth) gives rise to both tertiary education
 and economic conservistism (study <- wealth -> economic conservatism). 
 Potentially both are true, and based on this model alone, we can
 really draw a strong conclusion about what is taking place.


 - - - - - - - - - - - - - - - - - - - - - - - -
 2.4.2 Modeling Pro-Immigrant Views ----
 
 Next we have an example of modeling pro-immigrant views.

Run the models yourself and attempt to identify
 direct, spurious, and mediated relationships.

model.2a <- lm(df$Pro_Immigrant ~ df$Age + df$Aust_Born + 
                 df$Female + df$Union_Member)

model.2b <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks)

model.2c <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income)

model.2d <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income  + df$Income_Security)

model.2e <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security +
                 df$Years_Tertiary_Study)

model.2f <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security +
                 df$Years_Tertiary_Study +
                 df$No_Religion)

model.2g <- lm(df$Pro_Immigrant ~  df$Age + df$Aust_Born + 
                 df$Female +
                 df$Union_Member +
                 df$Own_Home + 
                 df$Own_Business + df$Own_Savings + df$ Own_Stocks +
                 df$Income + df$Income_Security +
                 df$Years_Tertiary_Study +
                 df$No_Religion + 
                 df$Labor + df$Green + df$Coalition)

invisible(capture.output(stargazer(model.2a, model.2b, 
                   model.2c, model.2d, 
                   model.2e, model.2f, model.2g, 
                   type="html", out="models.2.htm", 
                   keep.stat=c("n","rsq", "adj.rsq"))))
browseURL("models.2.htm")

 This is the end of the Presenting Results + Mediation
 R code/ R-script file



