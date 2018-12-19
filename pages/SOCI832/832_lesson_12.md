---
title: "Lesson 12: Multilevel Modeling"
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_12.html
summary: "This week we are going to ..."
---

*Last updated: 29 Oct 2018*


 
 SOCI832: Advanced Quant Methods
 Week 12: Multilevel Modeling
 Author: Nicholas Harrigan
 Date: 29/10/2018
 References: 
   (1) Chapter 19: 'Multilevel linear models' in Field, Miles, and Field, 
   2012. Discovering Statistics Using R.
 
   (2) G.G. Kreft and J. De Leeuw. Introducing Multilevel Modeling, number 1 of 
   Introducing Statistical Methods. Sage Publications, London, 1998.
   http://www.stat.ucla.edu/~deleeuw/janspubs/1998/books/kreft_deleeuw_B_98.pdf

  (3) Mark Tranmer, 2010. "What is Multilevel Modelling?" https://www.youtube.com/watch?v=_lrB-ZaLQE0

  (4) Institute for Digital Research and Education, n.d. 'Textbook Examples Introduction to Multilevel 
   Modeling by Kreft and de Leeuw' https://stats.idre.ucla.edu/other/examples/imm/
 

 preparation
update.packages(ask = FALSE)
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE)
if (!require("dplyr")) install.packages("dplyr", dependencies = TRUE)
if (!require("ggrepel")) install.packages("ggrepel", dependencies = TRUE)
if (!require("sjlabelled")) install.packages("sjlabelled", dependencies = TRUE)
if (!require("sjmisc")) install.packages("sjmisc", dependencies = TRUE)
if (!require("sjPlot")) install.packages("sjPlot", dependencies = TRUE)
if (!require("lme4")) install.packages("lme4", dependencies = TRUE)
if (!require("dotwhisker")) install.packages("dotwhisker", dependencies = TRUE)
if (!require("broom")) install.packages("broom", dependencies = TRUE)
if (!require("lattice")) install.packages("lattice", dependencies = TRUE)
library(ggplot2)
library(dplyr)
library(ggrepel)
library(sjlabelled)
library(sjmisc) 
library(sjPlot)
library(lme4)
library(dotwhisker)
library(broom)
library(lattice)                          for dotplot()


 Turn off scientific notation
 To turn back on type: options(scipen = 0)
options(scipen = 999)

 1. Theory
 
 Multilevel modelling is a method for dealing with the fact that
 cases (e.g. people) in a dataset are not really statistically independent.
 
 As Mark Tranmer in the video in the references says "People are not
 raffle tickets", meaning that we - in the real social world - 
 we have groups, contexts, and institutions in common. 

Simmel wrote that individuals lie at the intersection of many 
 social circles. These circles might be our family, our workplace,
 our schools, our local government area, our nation, or many other
 contexts.

The power of multilevel modeling is that it can take account
 of the fact that people or cases situated within a larger
 context (a level) can systematically vary together - in a 
 way that is simply a function of that particular context.

For example, it might turn out that if we analysed HSC results
 students from particular schools - even when we control for all
 the characteristics of the students - get a higher (or lower)
 University Entrance Rank simply because of the school they attend.

1.1 Multilevel modelling with the tools we already have
      #
 Now multilevel modelling is associated with a whole body of complex
 advanced statistics (much of which is nicely hidden from us
 by R and textbook explanations). 

However, we can do basic multilevel modelling with the tools
 that we already have learnt in this course.

The main way we can do this is by including a 'dummy' 
 variable for each case of the context (e.g. for each
 school).

1.2. Some terminology
 There is a lot of confusing terminology when it comes to 
 multilevel modelling. I will try to provide a simplified 
 glossary for you here. Not everything will make sense now
 but it will be useful to refer back to later, hopefully.

Level 1: This is the smallest or micro unit of analysis. 
 For example, if we are analysing students who are nested within
 schools, then students are the Level 1 cases.

Level 2: This is the next largest unit of analysis. For 
 example, if we analysing students withing schools, schools are
 the Level 2 cases. This is also called a 'context', or 'group'.

Level 3: We can have more levels - 3, 4, 5, etc - with
 each level being a larger context, within which the cases of
 the previous level are nested. For example, schools could be
 nested within districts (Level 3), which are nested within
 states (Level 4), which are nested within nations (Level 5).

Contexts or groups: These are the units of analysis of one of
 the higher levels of the models, such as the school or nation.
 
 Fixed coefficients: These are the normal sort of coefficients we
 are used to using in linear and logistic regression models. They
 are called 'fixed' because there is assumed to be one value
 for the coefficient (which we may not know, but we are trying to 
 estimate) which applies to all cases (e.g. persons) in the model.

Example 1: We have the cooefficient for hours of study on maths score.
 This will be a number (a coefficient) which says - on average - how
 much higher (or lower) a person scores on a maths test for each extra
 hour of studying then do.

Example 2: We could also have a model where we put in dummy variables
 for each school - Hurstville Boys, Sydney Grammar, Penrith High, etc. -
 and estimate the average increase (or decrease) in maths score for 
 students who attend each school. Students at School 1 might get an 
 average of 2.5 marks higher in the maths test, while students at 
 School 2 might get an average of 5 marks lower. 

In both example 1 and example 2, the coefficients for the variables 
 (hours study, and for each school (a dummy variable - 1/0)) are
 said to be 'fixed' because they apply uniformly to all cases, and
 there is no particular assumed 'pattern' or distribution to the 
 coefficients themselves. 

Random coefficients: These are the main alternative to Fixed coefficients
 The word 'random' here is a bit misleading. It probably should say 
 'normally distributed coefficients' - meaning that the coefficients
 themselves - at each level of the model (e.g. school) are themselves
 normally distributed, like a variable. 
 
 What this means is that if, for example, we had 20 schools, and we 
 were modelling the effect of schools on maths test results, we would
 have a choice: 
 (1) to model the each school as a fixed effect (i.e. dummy
 variable), where each school has an independent effect on math test
 scores. The coefficients of each school would have no particular 
 structure or distribution. The coefficients could be clustered, or 
 unclustered - they would not be normally distributed.
 (2) to model the effect of schools as a random coefficient, where
 the distribution of coefficients for each school has a normal distribution,
 and where the variance of that distribution of coefficients is estimated. 

1.3 An example
 This is easier to explain with an example and with some graphs.
 
 We are using an example from this website run out of University of
 California, Los Angles (UCLA):
 https://stats.idre.ucla.edu/other/examples/imm/ 

Dataset is students from 10 handpicked schools, representing a subset of
 students and schools from a US survey
 of eight-grade students at 1000 schools (800 public
 200 private).
imm10 <- read_stata("https://stats.idre.ucla.edu/stat/stata/examples/mlm_imm/imm10.dta")

 There are quite a lot of variables in the dataset, but we are going
 start by using just three:
 homework: number of hours of homework - Level 1 variable
 math: score in a math test - expanatory variable
 schnum: a number for each school - Level 2 variable

 We can take a quick look at our data and look at the
 different means for maths and homework at each school
imm10 %>%
  group_by(schid) %>%
  summarise_at(vars(math, homework), funs(n(), mean(., na.rm=TRUE)))

 Model with homework - standard linear regression
 This is a standard model of maths test score, with
 each student treated as an independent (not nested) case.
 Source: Table 2.3, page 27, (Kreft and De Leeuw, 1998)
model1 <- lm(math ~ homework, data = imm10)
summary(model1)

 We can visualise this model with a simple graph

palette(rainbow(10)) 
gg <- ggplot(imm10, aes(y = math, x = homework)) +
  geom_smooth(method = lm, color = "black") +
  geom_point(size = 1.5, alpha = 0.8, colour=factor(imm10$schnum)) +
  theme(legend.position="none") 
print(gg)


 We can now do a simple 'fixed coefficients' multilevel
 model, by running a standard linear regression model
 with schools as dummies
model2 <- lm(math ~ homework + as.factor(schnum), data = imm10)
summary(model2)

 We can visualise this model with the following code:
imm10$FEPredictions <- fitted(model2)
ml_est <- coef(summary(model2))[ , "Estimate"]
ml_se <- coef(summary(model2))[ , "Std. Error"]

palette(rainbow(10)) 
gg <- ggplot(imm10, aes(y = math, x = homework)) +
  geom_line(aes(y = FEPredictions, color=as.factor(schnum))) +
  geom_abline(slope = ml_est[2], intercept = ml_est[1], size=1) +
  geom_point(size = 1.5, alpha = 0.8, colour=factor(imm10$schnum)) +
  theme(legend.position="none") 
print(gg)

 draw a dot-and-whisker plot
dwplot(model2,colour = "grey60") +  plots the coefficients
  geom_vline(xintercept = 0, alpha = .3) +   puts a transparent grey line at zero
  theme_bw() +  a theme that looks nice
  scale_colour_grey() +   makes it a bit nicer in black and white
  theme(legend.position="none")  gets rid of legend

 We can also run a 'random coefficients' multilevel model,
 with the lmer() function. 
 This is what is called a 'random intercept' model, because we 
 only allow the intercept of the schools to vary.
model3 <- lmer(math ~ homework + (1|schnum), REML=FALSE, data = imm10)
summary(model3)

 We can visualise this model with the following code:
imm10$REPredictions <- fitted(model3)
ml_est <- coef(summary(model3))[ , "Estimate"]
ml_se <- coef(summary(model3))[ , "Std. Error"]

palette(rainbow(10)) 
gg <- ggplot(imm10, aes(y = math, x = homework)) +
  geom_line(aes(y = REPredictions, color=as.factor(schnum))) +
  geom_abline(slope = ml_est[2], intercept = ml_est[1], size=1) +
  geom_point(size = 1.5, alpha = 0.8, colour=factor(imm10$schnum)) +
  theme(legend.position="none") 
print(gg)

dotplot(ranef(model3, condVar=TRUE)) 

 RANDOM SLOPE + INTERCEPT MODEL
 We can also run a 'random slope and intercept' multilevel model.
 The slopes (between maths and homework) can now vary as well.
model4 <- lmer(math ~ homework + (homework|schnum), REML=FALSE, data = imm10)
summary(model4)

 We can visualise this model with the following code:
imm10$REPredictions <- fitted(model4)
ml_est <- coef(summary(model4))[ , "Estimate"]
ml_se <- coef(summary(model4))[ , "Std. Error"]

palette(rainbow(10)) 
gg <- ggplot(imm10, aes(y = math, x = homework)) +
  geom_line(aes(y = REPredictions, color=as.factor(schnum))) +
  geom_abline(slope = ml_est[2], intercept = ml_est[1], size=1) +
  geom_point(size = 1.5, alpha = 0.8, colour=factor(imm10$schnum)) +
  theme(legend.position="none") 
print(gg)

dotplot(ranef(model4, condVar=TRUE))

 LEVEL 1 and LEVEL 2 FIXED VARIABLES + LEVEL 3 RANDOM VARIABLE (optional)
 We can now make the model more complex, by including, for example
 SES effects - both at the individual (ses) and school level (meanses).
 And we can add a third level 'region'.
model5 <- lmer(math ~ homework + ses + meanses + (homework|schnum), REML=FALSE, data = imm10)
summary(model5)

dotplot(ranef(model5, condVar=TRUE))

