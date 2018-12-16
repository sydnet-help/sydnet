---
title: Linear Regression
keywords: sample
summary: "This is a first run"
sidebar: mydoc_sidebar
permalink: linear_regression.html
folder: statistics
---


## Objectives

1.       Understand the concept behind linear regression

2.       Know how to perform simple and multiple linear regression in R

3.       Know how to interpret linear regression results in R


## New concepts

- Linear regression
- Coefficient
- Independent variables
- Dependent variables
- Model

## Related concepts (already covered)

- Standard Error
- Statistical Significance
- Correlation

## Introduction

You often hear in sociology about how the world is unfair, particularly the economy: women earn less than men, degree holders earn more than non-degree holders, different races get paid different amounts for the same job, and so forth.

For an empirical researcher, the obvious first question is “Is this true?” The second question, is “If it is true, how much more/less do women/men/degree holders/etc get paid?”

You have learnt various techniques that you could use to analyse this type of data: we could see if there is a correlation between earnings and years of experience; we could see if there is a difference in the mean earnings between a man and a woman; we could even construct and experiment where we send people of different races, with the same CVs, for job interviews, and compare the salaries they are offered.

The method we are going to use today – linear regression - allows us put all the various predictors (we call independent variables) into a model of an outcome (the dependent variable).

## What is a model?
In architecture, a model is a simplified representation of a building.

In social science statistics we aren’t modelling buildings. We are modelling social processes that generate data. So in the social sciences a statistical model is a simplified (also called ‘idealised’) representation of the social process that generate our dataset.

In summary, a statistical model is an idealised representation of the process that generated a dataset.

If we were thinking about wages, and how they are affected by gender (which equals 1 if the person is a woman), we might think that a good model of wages is:

Wages per month ($) = $2,000 - $500*Gender 

This says that men earn $2000 on average and women earn $500 less than men. Since women are coded as 1 and men as 0, the average wage for men is:

Wages per month ($) = $2,000 - $500*0 =$2000

The average wage for women is:

Wages per month ($) = $2,000 - $500*1 = $1500 

We might later realize that a worker’s age also affects his/her wages, and we can always add that to our model. So we might realize a better model of wages is:

Wages per month ($) = $2,000 - $500*Gender + $100*Age


This means that as a worker’s age increases, his/her monthly wages increase by $100. In reality, however, we do not know what we should multiply Gender and Age by (the numbers we multiply Gender and Age by are called the coefficients). Linear regression gives us a way to find these numbers.

## Example

Suppose we have data on workers’ age, gender and monthly wage. A scatterplot of the data is given below, with men as red points and women as blue points.

{% include image.html file="R\linear_regression\lr_photo_1.png" alt="Linear Regression Model 1" %}

Initially, we might think that the average wage is a good enough model for our purposes. The average wage is plotted against the scatterplot below, as a black line.

{% include image.html file="R\linear_regression\lr_photo_2.png" alt="Linear Regression Model 2" %}

But we would like to know how wages differ between men and women, so this model seems to be inadequate. We could then use linear regression to create a model of how wages are affected by gender. It turns out that the model is:

 Wages per month ($) = 5927 – 470*Gender

Represented on the scatterplot, the model looks like this (with red representing the model for men, and blue for women):

{% include image.html file="R\linear_regression\lr_photo_3.png" alt="Linear Regression Model 3" %}


However, when we look at the scatterplot it seems like wages are increasing with age, which this model doesn’t account for. To solve this problem, we can include age in the model as well. After estimating a linear regression model with both age and gender, we get the following result:

Wages per month ($) = 2277 – 556*Gender + 92*Age

Represented on the scatterplot, the model now looks like this (with red representing the model for men, and blue for women):

{% include image.html file="R\linear_regression\lr_photo_4.png" alt="Linear Regression Model 4" %}

This seems to represent the trend much better, but there still seems to be quite a lot of the difference in wages across individuals that hasn’t been explained. This is normal – there are many things about social processes that we can’t explain.

## The formal model
In mathematical terms, we say that linear regression is a method of estimating the relationship between a dependent variable (henceforth known as Y) and one or more independent variables (henceforth known as X1, X2 and so forth).

The general form of a linear regression is:

Y = B0 + B1X1 + B2X2 + ... + e

In this equation, e is called the error term, and it is basically all the variation in our dependent variable (Y) which we can’t explain (which in social sciences is a lot). It is basically the noise in our model.

B0 is the intercept or constant. It is the $2,000 in our equations for earnings per month. It is the value of Y (our dependent variable) when all our independent variables (X1, X2, etc.) are zero.

B1,  B2, etc. are numbers which represent how much the dependent variable (Y) changes when one independent variable (such as X1 or X2) changes – keeping all other independent variables constant. They are also known as the coefficients of the independent variables.

The purpose of statistical modelling, such as that which we do in R, is to estimate the values for  B1,  B2, etc.   

## Simple Linear Regression

Simple linear regression refers to regression in the form:

Y = B0 + B1X1 + e


That is, there is only one constant and one independent variable in the regression. 

## Example 1


We have the CSV file wages.csv, comprising information on the gender (0 is male and 1 is female), age (in years), years of experience and monthly wage (in dollars) of 217 workers between the ages of 30 and 50. Note that all this data is simulated. Suppose we want to estimate the relationship between wages and gender.

We use the following commands:

{% highlight css %}

wage_data <- read.csv("<filepath>\\wages.csv", header=TRUE)
model_1<-lm(Wage ~ Gender, data=wage_data)
summary(model_1)

{% endhighlight %}

**You should replace <filepath> with the file path of wages.csv.**

To run the commands in RStudio, highlight all the commands you want to run, go to the top right of the console window, and click “Run”

Line 1 reads the contents of the CSV file into the dataframe wage_data, and header=TRUE indicates that the first row of the CSV file contains the variable name.

Line 2 tells R to estimate the simple linear regression with dependent variable Wages and independent variable Gender, and to include a constant. The results are saved in object model_1.

Running Line 3 produces the following:

{% include image.html file="R\linear_regression\lr_photo_5.png" alt="Linear Regression Model 5" %}

Before going into the interpretation of the results, let’s go over the components of the results:

{% include image.html file="R\linear_regression\lr_photo_6.png" alt="Linear Regression Model 6" %}

The main things we want to focus on are the numbers under the headings Estimate and Pr(>|t|). The numbers under Estimate 
give us the coefficients (B0 and B1 in this case). The number under Pr(>|t|) tells us if this estimate – the coefficient – 
is significantly different from zero (if it is “Statistically Significant”). As a rule, a coefficient is significantly 
different from zero (at the 5% level of significance) when the number under Pr(>|t|) is less than 0.05.

Gender is coded with 0 for males and 1 for females. The estimates tell us that men earn $3630 on average, and that women 
earn on average $471 less than men. Both the constant and gender are significantly different from 0.

The other thing to notice is the multiple R-squared statistic, or R2. This indicates how well the model fits the data. This 
varies from 0 to 1, with higher numbers indicating a better fit. Here, the R2 is 0.03 - which indicates the model only 
accounts for about 3% of the variance in the data.

## Multiple linear regression

Based on what we’ve learnt so far, one might ask: “How is this any different from calculating a correlation coefficient?” The importance of linear regression lies in the fact that more than one independent variable can be added into a regression. This is known as multiple linear regression. Each coefficient in such a regression represents the effect of changing the associated independent variable while keeping all other independent variables constant.

The general form of a multiple linear regression is:


Y = B0 + B1X1 + B2X2 + ... + e

## Example 2:

Consider the wage data discussed previously. Now, we might want to estimate the effect of gender, and age on earnings. Sample code for doing this is as follows:

{% highlight css %}

wage_data <- read.csv("filepath \\wages.csv", header=TRUE)
model_2<-lm(Wage ~ Gender + Age, data=wage_data)
summary(model_2)

{% endhighlight %}

````
wage_data <- read.csv("filepath \\wages.csv", header=TRUE)
model_2<-lm(Wage ~ Gender + Age, data=wage_data)
summary(model_2)
````

Running this code produces the following output:

{% include image.html file="R\linear_regression\lr_photo_7.png" alt="Linear Regression Model 7" %}

This tells us that while keeping gender (variable Gender) constant, age (variable Age) increases the wage a person gets, and that while keeping age constant, females earn less than males.

## Exercises

Question 1: 	Suppose we would like to estimate the effects of Age, Experience and Gender on wages. How would we do this in R? Assume that the data is stored in dataframe mydata.

	a.       lm(Wage ~ Gender + Age + Experience, data = mydata)

	b.       lm(Wage ~ Gender - Age - Experience, dataframe = mydata)

	c.       lm(Wage ~ Gender Age Experience, data=mydata)

	d.       lm(Wage ~ Gender + Age + Experience, dataframe = mydata)

	e.       lm(Wage ~ Gender, Age, Experience, data=mydata)

---

Question 2:  	Estimate the model including Age, Experience and Gender using the code you’ve come up with in Question 2, and the data in wages.csv. Which variables in the model are significant (at the 5% level)? Disregard the constant.

	a.       None of the variables are significant

	b.       Age

	c.       Experience

	d.       Gender, Experience

	e.       Gender, Age

---

Question 3: 	In the regression model you’ve estimated in Question 2, what’s the average change in pay that a worker gets if s/he has one more year of experience at the same age?

	a.       -438

	b.       807

	c.       97.5

	d.       0.443

	e.       29.9

---

Question 4: 	In the regression model you’ve estimated in Question 2, what’s the average difference in pay between male and female workers of the same age and years of experience?

	a.       -438

	b.       807

	c.       97.5

	d.       0.443

	e.       29.9

---

Question 5: 	In the regression model you’ve estimated in Question 2, how much would a 30 year old male worker with 2 years of experience earn on average? (Hint: substitute the given values into the regression equation).

	a.       $1450

	b.       $1800

	c.       $1900

	d.       $1700

	e.       $2100

---

Question 6: 	Does the regression model you’ve estimated in Question 2 fit the data better than the two models given in the tutorial?

	a.       Yes

	b.       No

	c.       Can’t tell from the information

---

Question 7: 	In the regression model you’ve estimated in Question 2, can you conclude at the 5% significance level that older workers earn more than younger workers of the same gender and years of experience?

	a.       Yes

	b.       No

	c.       Can’t tell from the information


{% include links.html %}