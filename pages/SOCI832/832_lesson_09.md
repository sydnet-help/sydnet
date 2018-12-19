---
title: "Lesson 9: Path Analysis"
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_09.html
summary: "This week we are going to learn about path analysis. Before we get into the details of path analysis we are going to revise and extend our understanding of logistic regression and odds ratios. We will then introduce the idea of path analysis - the idea that we can model the multiple causal pathways that link multiple causes and effects."
---

*Last updated: 8 Oct 2018*

***Author:** Nicholas Harrigan*

## OVERVIEW

The structure of today's class is as follows
     (1) Introduction to today's dataset
     (2) Revision of logistic regression
     (3) More on odds ratios
     (4) An introduction to path analysis

## 1. Introduction to today's dataset
 
### 1.1 Motivation

 This week's example dataset is one very close to my heart. It is a dataset I have simulated to be almost identical to the dataset used in this paper:

* Harrigan, N. M., Koh, C. Y., & Amirrudin, A. (2017). Threat of deportation as proximal social determinant
 of mental health amongst migrant workers. Journal of immigrant and minority health, 19(3), 511-522. browseURL("http://sci-hub.tw/10.1007/s10903-016-0532-x")

The dataset contains information on 582 migrant workers in Singapore. The dataset was collected in 2013, and it was collect by university students similar to yourselves. 

These workers face many difficult conditions, as they lack many basic labour and civil rights -  there is no minimum wage, protest by foreigners is illegal, and there is no protection from sacking and deportation for any reason. 

The workers we studied were from the construction and marine (shipyard) industries, and almost all the workers were from Bangaldesh or India.

The study was motivated by a desire to understand the problems faced by one particular group of these workers: those with injury and salary claims.

Every night around 300-500 of construction and shipyard workers from South Asia who have injury or salary claims are fed by a Non-Government Organisation (NGO) called Transient Workers Count Too (TWC2). The vast majority of these workers have run away from their employers, and are caught in a limbo where they are making claims to get compensated, but also languishing without employment, income, or even proper housing. 

An undergraduate student (Ms Koh) and I wanted to use validated psychological measures to be able to study what were the primary causes of distress for these workers - with the idea that this would hopefully give insight to the social structures and problems that were causing the most significant problems. 

### 1.2 The data

The dataset we will be using this week is actually a simulated dataset - meaning that while the dataset we will be using looks like the real dataset, it has actually
been simulated by R. 

The advantage of using a simulated dataset is that it protects the confidentiality of participants. The migrant workers who answered surveys were promised confidentiality, and also faced significant harm if they could ever be identified. About half the dataset is comprised of workers who had workplace injuries or had made salary claims against their employers. And a majority of these workers claimed that their employers had undertaken some form of illegal or unethical action against the worker - such as threatening deportation, physically abusing the worker, or neglecting to provide medical treatment.

I have provided a very simple codebook for the datset 
here:

	browseURL("https://mqsociology.github.io/learn-r/soci832/aw_codebook_x.htm")

You can load the dataset into R by simply running the
following line:

	load(url("https://mqsociology.github.io/learn-r/soci832/aw.RData"))

## 2. Revision of logistic regression

### 2.1 Example/Provocation

Open up the article using the link below:

	browseURL("http://sci-hub.tw/10.1007/s10903-016-0532-x")

Take a look at Table 2 on page 6 of the PDF. You can see five logistic regression models here. Can you make sense of them?
 
See if you can answer these questions:
 1. What is the dependent variable in each model?
 2. What values can the dependent variable take? 
 3. What are the independent variables in each model? 
 4. What values can the independent variables take?
 5. Why are there multiple models with the same dependent
 variable?
 6. Why do we not include all independent variables in
 all the models?
 7. How 'good' are each of the models? [Hint: R-square
 is an estimate of goodness of fit]

[note, if you are finding it hard to read the table in portrait, you can rotate the pages if you are in Adobe Acrobat by right clicking and choosing 'rotate clockwise']

### 2.2 Summary of Logistic Regression

Some outcome variables are inherently binary: Death, catching a disease, being cured, and pregnancy, are all inherently binary outcomes.

Such outcomes violate many of the basic assumptions of linear regression models, and so we can't use them. What would it mean that drinking a glass of red wine each night reduced your chance of dying by 0.1 units of death? It doesn't make sense. 
 
To deal with this inherent limitation of linear regression models, statistians developed  the logistic regression (or logit) model, and also a related model called probit.

A logistic regression model still uses a linear model of the relationship between the predictor (independent) variables, and the outcome (dependent) variable. 

What logisitic regression models change is the 'link' - the function - by which one unit of predictor influences the outcome. 

Where the equation for linear regression is:

	y = Bx + c

The equation for a similar logit is:
 
	Probability(y=1) = 1/(1+e^-(Bx+c))

	Where:
    	 e = base of natural log (approx 3),
   		 ^ = to the power of.

If that equation looks confusing to you DON'T WORRY, because it is!!!

The reason the equation is confusing is because really it makes more sense if we write it as this.

	log(y/(1-y)) = Bx + C

or even more simply

	logit(y) = Bx + C

The best explanation for this is on this statistics webpage for UCLA
 <https://stats.idre.ucla.edu/other/mult-pkg/faq/general/faq-how-do-i-interpret-odds-ratios-in-logistic-regression/>

I will, however, try to summarise what it says.
 
1. Even though we have a binary outcome we do still want to be able to say something like "for each unit increase in X (e.g. glasses of wine) there is B unit increase in the probability of Y (e.g. dying in a car crash when you drive home)."

2. Thus, the right hand side of the equation (Bx + C) remains the same. 

3. On the left side of the equation, which is 'y' in a linear regression, we would - as humans who think in simple terms - ideally like 'y' to be a probability of an event.

4. It turns out - when we consult our mathematical friends - there are at least two major problems with just making 'y' a probability:

* First: probabilities range from zero to one, and when you are estimating a mathematical equation, it is difficult to have a variable that is bound between two values (0 and 1)

* Second: Unit increments of probability (from 0.5 to 0.59999, or 0.9 to 0.99999) are not linear. In the above two examples, a 0.09999 change in probibility shifts means much more when it increases an event from 9 in 10 to almost 100% certainty, than it does when it simply changes the chance of something happening from 50:50 to 6/10.

5. Our mathematical friends, however, have found a solution, which is to undertake two transformations of a probability, to make it into a number that is 'well behaved' and doesn't suffer from these problems of limited range, and non-linearity. The two transformations are:
 
 * First: to transform to the odds. Odds are (p/(1-p)), which means: the chance of something happening (p), divided by the chance of it not happening (1-p). This number still has the problem of only having a range of 0 to positive infinity. And also it is non-linear (compare moving from 0 to 1 and from 1 to 2, or 1 to infinity),

* Second: to take the log of the Odds. This solves both problems, providing a variable with range from minus infinity to plus infinity, and which has a distribution around the probability of 0.5 which is 'similar' to a normal distribution.

6. A key thing to notice here is that the 'form' of a logistic regression is very similar to that of a linear regression. The right hand side (the causal variables) is the same, while the left hand side, we still have 'y', but we have transformed it by taking the log-odds. 

If you look again at the two equations, they should look a little less scary now.

	logit(y) = Bx + C

	log(y/(1-y)) = Bx + C

7. Remember that when we report regression coefficients, we are reporting estimated values for 'B' in the above equations. 

It turns out that when we report 'B' in regression models we report it measured in one of two units:

* coefficients are generally output in most statistical packages as 'log-odds'. Generally we just called these 'coefficients'  Note that they vary from minus infinity to plus infinity, and 'no effect' is when the coefficient is zero. This coefficient is often called 'B'.
* when actually discussing our results and when publishing regression tables in journals, we generally transform our coefficients into 'odds ratios', which is simply the exponential of B. Remember the basic mathematical rule which is that the natural log and exponential are inverse operations, so exp(log(p/(1-p))) = p/(1-p) The exp and log just cancel each other out.
 
### 2.3 Another good example from UCLA 

<https://stats.idre.ucla.edu/r/dae/logit-regression/>

## 3. Odds Ratios

### 3.1 Example/Provocation

Returning to the article Harrigan et al. 2017, look again at Table 2, but this time focus on the coefficients for the independent variables. 

1. Is the table reporting coefficients or odds ratios? How do you know?
2. How would you explain the coefficents/odds ratios? 

### 3.2 How to explain Odds Ratios

Look at the first paragraph of the 'Discussion' and identify the sentences where key odds ratios in Models 2 and Models 5 (of Table 2) are explained. 

"Through a path analysis of quantitative surveys of 582 migrant workers, Study 1 showed that one of the primary proximate causes of risk of serious mental illness is the threat of deportation, a threat which, by definition, only migrants are vulnerable to. Controlling for all other factors, the odds of suffering from serious mental illness were 7.5 times higher (95% CI: 2.78, 20.34) for migrant workers threatened with deportation, as compared to those not threatened. The path analysis in Study 1 shows that the migrant workers at higher risk of threat of deportation, and thus higher risks of mental illness, are those in workplace conflict with their employer, i.e. those with salary or injury disputes. While an ordinary migrant worker (i.e. without an injury or salary dispute) had an 11% chance of being threatened with deportation, 64% of claimant migrant workers (i.e. with injury or salary dispute) were threatened. Using statistical modelling and controlling for other factors, the odds of being threatened with deportation were 8 times higher (95% CI: 3.39, 20.5) for migrant workers with salary disputes, and more than 12 times higher (95% CI: 6.7, 22.12) for migrant workers with injury disputes, as compared to an ordinary worker." 
 
Question: What are the key phrases you need to use when explaining an odds ratio in a paper?

### 3.3 Understanding Odd Ratios

This is a fanastic guide to Odds Ratios. 

I have provided it so that we can read through it in class and talk through the concepts.

<https://stats.idre.ucla.edu/other/mult-pkg/faq/general/faq-how-do-i-interpret-odds-ratios-in-logistic-regression/>

## 4. Introduction to path analysis

### 4.1 Example/Provocation

Path Analysis is an extension of regression modelling, where we attempt to estimate the magnitudes and the significance of a range of causal pathways between different variables. 

In the sample paper, take a look at Figure 1 on page 2, and then Figure 2 on page 7. 

Figure 1 is a path diagram at the conceptual (or theoretical) level. The variables are simply key concepts, with hypothesised pathways represented by the arrows.

Take a look at Figure 2. This is the final path diagram for the models presented in Table 2.

1. What do the arrows represent?
2. What do the numbers represent?
3. What does it mean when an arrow is 
solid or dotted?
4. Why are there not arrows between all the boxes?
5. What does it mean when an arrow points
to the middle of another arrow? (such as
ordinary workers and the arrow from
uncleared agent fees to threatened with
deportation)
6. Where is Model 2 in this figure? Model 3?
Model 4? Model 5? Model 1?
 
### 4.2 Basic Principles

Most of the fundamentals of path analysis are actually simple and intuitive. 
 
There are more complex version of path analysis such as Structural Equation Modelling (SEM) and mediation analysis, but these are only necessary for specific application, and beyond the scope of this course.

The main 'guidelines' are these:

1. If you are using cross section data, then you need 'logical' (i.e. an argument) and theoretical (i.e. some larger body of assumptions and knowledge which specifies relationships between variables) basis for choosing which variables are independent (i.e. purely causal), which are mediating (i.e. are both causes and effects of other variables), and which are dependent (purely outcomes). 

2. Arrows can only go in one direction (or if they don't go in only one direction, they are an association, not a 'path')

3. Arrows cannot form cycles (they must be acyclic). This is because if you have cycles in your diagram then you can get feedback/forward-feeding loops, which can't be easily modelled with simple linear modelling

4. Any variable which has arrows coming into it is a dependent variable in a regression model

5. You can think of there being two path diagrams:

* the first is of all potentially significant relationships that you are testing (i.e. all variables in your models). In this, an arrow represent a variable in the model (the source of the arrow) of a dependent variable (the target of the arrow).

* the second is the diagram of ONLY significant relationships. This is the diagram of the models after they have been run. In this you generally need distinguish between positive and negative relationships e.g. with dots and lines. You also need to include parameters and significance (e.g. stars \*).

6. We represent interaction effects (moderation) between two variables as an arrow pointing at the middle of the relationship they are modifying.

### 4.3 The R-code 

	if (!require("oddsratio")) install.packages("oddsratio")
	if (!require("rcompanion")) install.packages("rcompanion")
	if (!require("stargazer")) install.packages("stargazer")
	if (!require("xtable")) install.packages("xtable")
	library(oddsratio)
	library(rcompanion)
	library(stargazer) 
	library(xtable)

**codebook**

	browseURL("https://mqsociology.github.io/learn-r/soci832/aw_codebook_x.htm")

**dataset: just run the following line**
	
	load(url("https://mqsociology.github.io/learn-r/soci832/aw.RData"))

**Model 1: SMI - simple model**

	model1 <- glm( aw$smi~aw$Age+aw$Dependents+aw$Salary + 
                 aw$Hours + aw$Construction + aw$Bangladeshi +
                 aw$Uncleared_agent_fee,family="binomial")

	summary(model1)
	or_glm(data = aw, model = model1)
	nagelkerke((model1))

**Model 2 - Serious mental illness**

	model2 <- glm( aw$smi~aw$Age+aw$Dependents+aw$Salary + 
                 aw$Hours + aw$Construction + aw$Bangladeshi
               + aw$Ordinary_worker_x_Fee + aw$Claimant_worker_x_Fee + 
                 aw$Injury_dispute + aw$Salary_dispute_only +
                 aw$Time_since_injury + aw$Rent_empl +
                 aw$Threatened_with_deportation + aw$Work_Permit +
                 aw$Threat_deport_x_Injury +
                 aw$Threat_deport_x_Salary,family="binomial")
	summary(model2)
	or_glm(data = aw, model = model2)
	nagelkerke((model2))

**Model 3 - Injury dispute**

	model3 <- glm( aw$Injury_dispute~aw$Age+aw$Dependents+aw$Salary + 	
                 aw$Hours + aw$Construction + aw$Bangladeshi +
                 aw$Uncleared_agent_fee,family="binomial")
	summary(model3)
	or_glm(data = aw, model = model3)
	nagelkerke((model3))

**Model 4 - Salary dispute**

	model4 <- glm( aw$Salary_dispute~aw$Age+aw$Dependents+aw$Salary + 
                 aw$Hours + aw$Construction + aw$Bangladeshi +
                 aw$Uncleared_agent_fee,family="binomial")
	summary(model4)
	or_glm(data = aw, model = model4)
	nagelkerke((model4))

**Model 5 - Threat of Deportation**

	model5 <- glm( aw$Threatened_with_deportation ~ aw$Age +
                 aw$Dependents + aw$Salary + 
                 aw$Hours + aw$Construction + aw$Bangladeshi
               + aw$Ordinary_worker_x_Fee + aw$Claimant_worker_x_Fee + 
                 aw$Injury_dispute + aw$Salary_dispute_only ,family="binomial")
	summary(model5)
	or_glm(data = aw, model = model5)
	nagelkerke((model5))

**Displaying models simply, using stargazer**
	
	invisible(capture.output(stargazer(model1, model2, model3, model4, 
                                   model5,
                                   type="html", 
                                   out="models.1.htm", 
                                   t.auto = FALSE,
                                   apply.coef = exp,
                                   single.row = TRUE, report = "vc*",
                                   digits = 2, 
                                   keep.stat=c("n","rsq", "adj.rsq"))))
	browseURL("models.1.htm")

**Displaying odds ratios with confidence intervals**
You would need to cut and paste these ugly tables into excel and clean them up to use them.

	ormodel1 <- or_glm(data = aw, model = model1)
	ormodel2 <- or_glm(data = aw, model = model2)
	ormodel3 <- or_glm(data = aw, model = model3)
	ormodel4 <- or_glm(data = aw, model = model4)
	ormodel5 <- or_glm(data = aw, model = model5)

	x1 <- invisible(capture.output(print(xtable(ormodel1), type="html")))
	x2 <- invisible(capture.output(print(xtable(ormodel2), type="html")))
	x3 <- invisible(capture.output(print(xtable(ormodel3), type="html")))
	x4 <- invisible(capture.output(print(xtable(ormodel4), type="html")))
	x5 <- invisible(capture.output(print(xtable(ormodel5), type="html")))

	dput(x1, file = "ormodel1.html")	
	dput(x2, file = "ormodel2.html")
	dput(x3, file = "ormodel3.html")
	dput(x4, file = "ormodel4.html")
	dput(x5, file = "ormodel5.html")

	browseURL("ormodel1.html")
	browseURL("ormodel2.html")
	browseURL("ormodel3.html")
	browseURL("ormodel4.html")
	browseURL("ormodel5.html")

 These are two linear regression models for 'Kessler 6' as the dependent variable, rather than SMI

	model1.lm <- lm( aw$k6~aw$Age+aw$Dependents+aw$Salary +
                   aw$Hours + aw$Construction + aw$Bangladeshi
                 + aw$Uncleared_agent_fee)
	summary(model1.lm)

	model2.lm <- lm( aw$k6~aw$Age+aw$Dependents+aw$Salary +
                 aw$Hours + aw$Construction + aw$Bangladeshi
               + aw$Ordinary_worker_x_Fee + aw$Claimant_worker_x_Fee +
                 aw$Injury_dispute + aw$Salary_dispute +
                 aw$Salary_dispute*aw$Injury_dispute +
                 aw$Time_since_injury + aw$Rent_empl +
                 aw$Work_Permit + aw$Threatened_with_deportation +
                 aw$Threat_deport_x_Injury +
                 aw$Threat_deport_x_Salary)
	summary(model2.lm)

	invisible(capture.output(stargazer(model1.lm, model2.lm, model3, model4, model5,
                                   type="html",
                                   out="models.2.htm",
                                   t.auto = FALSE,
                                   single.row = TRUE,
                                   report = "vc*",
                                   digits = 2,
                                   keep.stat=c("n","rsq", "adj.rsq"))))
	browseURL("models.2.htm")

**Table 1: Descriptive statistics**

	invisible(capture.output(stargazer(aw[aw$Ordinary_worker==1,],
                                   type="html", title = "Ordinary workers (n = 241)",
                                   out="desc1.htm", summary.stat = c("n", "mean", "sd", "min", "max"), digits = 1, digits.extra = 5)))
	browseURL("desc1.htm")

	invisible(capture.output(stargazer(aw[aw$Ordinary_worker==0,] , type="html",title = "Claimant workers (n = 341)",
                                   out="desc2.htm", summary.stat = c("n", "mean", "sd", "min", "max"), digits = 1, digits.extra = 5)))
	browseURL("desc2.htm")