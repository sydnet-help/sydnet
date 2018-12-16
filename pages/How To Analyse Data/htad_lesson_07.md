---
title: "Lesson 7: Logistic Regression"
keywords: how_to_analyse_data
tags: 
sidebar: mydoc_sidebar
permalink: htad_lesson_07.html
summary: "We generally use linear regressions when we have (1) a dependent variable that is continuous (or a scale, or an index, or a count), and (2) we want to test the impact of (and/or control for) multiple independent variables. The ‘unstandardized coefficients’ for each independent variable - also called B - can be read as “For a one unit increase in the independent variable, the dependent variable goes up by B units, controlling for all other variables in the model.” "
---

### Introduction

We generally use logistic regressions when we have (1) a dependent variable that is binary (i.e. it has only two values, 0 and 1), and (2) we want to test the impact of (and/or control for) multiple independent variables. 

The process of running a regression in SPSS is basically the same as for linear regressions, with options for forced entry, hierarchical, and stepwise methods. When you read your results from a regression, you read the same two columns as in a linear regression (B and sig.). 

Significance (sig.) is read the same as for a linear regression. 

Because of the binary nature of the dependent variable in a logistic regression, the B is not so straightforward to interpret. B is basically a number which represents the impact of the independent variable on the probably of the dependent variable being 1. 

For this course, we are only going to interpret the significance, and direction (positive or negative) of B. So for significant (< 0.05) B coefficients we say that independent variables with positive B (greater than 0) increase the likelihood of the dependent variable being 1 (and the reverse for negative B values). 

We can also view the various different R-square values for the model, which is approximately the same meaning as that for a linear regression.

### Running a logistic regression

I’m just going to illustrate logistic regressions with FORCED ENTRY, because the procedure for hierarchical and stepwise methods is the same as that for linear regressions.

1)  Select Analyze > Regression > Binary Logistic…

<div style="text-align:center"><img src ="images/htad_lesson_07_image_01.jpg" style="max-width:60%;" /></div>
 
2)  Select the dependent variable and put it in the top box

3)  Select the independent variables and put these in the “Independent(s)” box.

<div style="text-align:center"><img src ="images/htad_lesson_07_image_02.jpg" style="max-width:60%;" /></div>

3)  Press OK. The regression will run and the output screen will appear

4)  You can then interpret the coefficients of the regression.
  a.  Look in the ‘Sig.’ column for the p-values

  b.  If the p-value < 0.05 then the independent variable has a significant impact on the dependent variable

  c.  For the significant variables, we then read the B values (coefficients), which are the effect of a one unit increase of the independent variable on the dependent variable.

  d.  The problem with Logistic Regressions is that the independent variables DO NOT HAVE A LINEAR effect on the dependent variable. This makes the B values difficult to interpret.  For this course we are not going to interpret the meaning of B values, except to ask (1) are they statistically significant; and (2) are they positive or negative, i.e. does the independent variable increase or decrease the likelihood of the dependent variable being 1 (rather than 0)

  e.  In this regression we can see that Gender is not statistically significant (p = 0.146)

  f.  Age is statistically significant. The older a person is, the less likely they are a virgin (B = -0.224)

  g.  Religiosity is statistically significant. The more religious a person, the more likely they are a virgin (B = 0.249)

<div style="text-align:center"><img src ="images/htad_lesson_07_image_03.jpg" style="max-width:60%;" /></div>
 
5)  You can find an R-square value for the regression model, in the SPSS output:

<div style="text-align:center"><img src ="images/htad_lesson_07_image_04.jpg" style="max-width:60%;" /></div>
 
You can choose to interpret either the Cox & Snell R Square, or the Nagelkerke R Square. These basically say that between 9% and 12% of the explained variance in virginity is explained by our three variables (gender, age, and religiosity).

