+++
title = "How to Analyse Data: Introduction"

date = 2018-12-30T00:00:00
# lastmod = 2018-12-30T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "How to Analyse Data: Introduction"
[menu.docs]
  parent = "How to Analyse Data"
  weight = 30
+++

Summary: One of the limitations of my research methods class is that the last three weeks on data analysis come a little bit too late for students to properly use this knowledge for analysing the data for their group project. To remedy this, I have developed this ‘Guide’ to introduce you to the most important tools and methods in social science data analysis. This ‘Guide’ is focused on the practical application of these tools and techniques. It doesn’t provide anything more than a rudimentary explanation of the theory behind these techniques. For this reason, this guide isn’t a substitute for the readings and classes on social science data analysis.


# Overview of lessons

## Qualitative Data Lesson

### 1. Analysing Qualitative Data

The main method of analysing qualitative data – data like interviews, video footage, letters, etc. – is to **code** the data into thematic categories. Generally, you do this by (1) reading a sample of your data and come up with a preliminary argument/abstract for your paper; (2) you then work out how you will present evidence for your argument by coming up with 5-15 headings/topics which you will organise your reporting of your primary data under; (3) you go through your primary data item by item, and cut and paste quotes from the primary data sources under relevant headings; and then (4) go through the material under each heading and reduce the material under each heading to about 200-500 words of summary, analysis, and exemplary quotes.

## Quantitative Data Lessons

### 2. Downloading your data and making a codebook

Before you analyse a quantitative dataset you need to download the data (generally from Qualtrics), and then make a codebook. A codebook is like the master plan to your dataset. Another researcher should be able to use your codebook to completely understand the raw information in your dataset.

### 3. Getting a quick feel for your data

The first analysis you generally want to do with a quantitative data set is to run a bi-variate correlation, almost always a Pearson’s correlation. The correlations you are particularly interested in are the correlations between the dependent variable(s) and the main independent variables. 

### 4. Experiments and simple tests

If you have quantitative data that is the result of an experiment, or which is basically a comparison of the mean values of a variable in two groups, then you are most likely to want to use a t-test. This will tell you whether the difference in the mean values of the variable for the two groups is statistically significant. 
 
###  5. Constructing and testing an index

If you have done a survey, chances are you have many different questions which test for the same underlying theoretical concept. For example, you might ask students about (1) their parents’ income (on a 1-5 scale) (2) their spending money (on a 1-7 scale) (3) their housing type (on a 1-3 scale). These variables all tap the underlying concept of “wealth” or “socio-economic status”. To create a ‘wealth index’, we do two things: (1) normalize each variable: Anormalised = (A – MeanA)/St DevA; (2) check that the Cronbach Alpha is > 0.6; (3) create the index by summing the normalized variables. Note: We can generally skip the normalization step if all variables have the same minimum and maximum.

###  6. Linear Regression

We generally use linear regressions when we have (1) a dependent variable that is continuous (or a scale, or an index, or a count), and (2) we want to test the impact of (and/or control for) multiple independent variables. The process of running a regression in SPSS is relatively straight-forward. You put your dependent variable in one field, and then you have three main methods for putting in your independent variables: you can put them in all at once (forced entry method), you can put them in as sets (hierarchical method), or you can put them all in and then drop out the non-significant results (a stepwise method called backwards selection). When you read your results from a regression, there are two main columns you read: the ‘unstandardized coefficients’ for B; and the significance (sig.). You can ignore all coefficients for which sig. > 0.05. Coefficients where the sig. < 0.05 are interpreted as “For a one unit increase in the independent variable, the dependent variable goes up by B units, controlling for all other variables in the model.” You also want to look for the R-square: this is the proportion of variation in the dependent variable explained by the independent variables in the model.

###  7. Logistic Regression

We generally use logistic regressions when we have (1) a dependent variable that is binary (i.e. it has only two values, 0 and 1), and (2) we want to test the impact of (and/or control for) multiple independent variables. The process of running a regression in SPSS is basically the same as for linear regressions, with options for forced entry, hierarchical, and stepwise methods. When you read your results from a regression, you read the same two columns as in a linear regression (B and sig.). Significance (sig.) is read the same as for a linear regression. Because of the binary nature of the dependent variable in a logistic regression, the B is not so straightforward to interpret. B is basically a number which represents the impact of the independent variable on the probably of the dependent variable being 1. For this course, we are only going to interpret the significance, and direction (positive or negative) of B. So for significant (< 0.05) B coefficients we say that independent variables with positive B (greater than 0) increase the likelihood of the dependent variable being 1 (and the reverse for negative B values). We can also view the various different R-square values for the model, which is approximately the same meaning as that for a linear regression.

### 8. Recode and Select Cases

A couple of other useful axillary functions you may want to use in SPSS are (1) Recode into same variable; (2) Recode into different variables; and (3) Select cases.

### 9. Cleaning up Data with Word and Excel

Something else you may need to do is clean up your data in Word, Excel, or Notepad. This section gives some basic tips.
