---
title: "Lesson 10: Visualisation"
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_10.html
summary: "This week we are going to ..."
---

*Last updated: 16 Oct 2018*

 
 SOCI832: Advanced Quant Methods
 Week 10: Visualising data
 Author: Hangyoung Lee (with changes by Nicholas Harrigan)
 Date: 16/10/2018
 Reference: http://www.strengejacke.de/sjPlot/reference/index.html
 1. Bar graph
 1.1 Basic bar graph
 1.2 Stacked bar graph
 1.3 Stacked bar graph for likert scale
 1.4 Grouped bar plot
  2. Box plot
 2.1 Simple box plot
 2.2 Grouped box plot
 2.3 3-way grouped box plot
  3. Histogram
  4. Scatterplot
 4.1 Simple scatter plot
 4.2 Grouped scatter plot
 4.3 Scatter plot with text label
  5. Correlation matrix
  6. Regression
 6.1 lm model - OLS regression model
 6.2 glm model - logistic regression
 

 preparation
if (!require("sjlabelled")) install.packages("sjlabelled", dependencies = TRUE)
if (!require("sjmisc")) install.packages("sjmisc", dependencies = TRUE)
if (!require("sjPlot")) install.packages("sjPlot", dependencies = TRUE)
if (!require("dplyr")) install.packages("dplyr", dependencies = TRUE)
if (!require("ggrepel")) install.packages("ggrepel", dependencies = TRUE)
library(sjlabelled)
library(sjmisc) 
library(sjPlot)
library(dplyr)
library(ggrepel)

 data
aus2012 <- readRDS(url("https://mqsociology.github.io/learn-r/soci832/aussa2012.RDS"))
lga <- readRDS(url("https://mqsociology.github.io/learn-r/soci832/nsw-lga-crime.RDS"))

 
 1. Bar graph
 
 1.1 Basic bar graph
sjp.frq(aus2012$fechld, type = "bar")
sjp.frq(aus2012$fechld, type = "bar", title = "Attitude toward working mom")  Add the title
sjp.frq(aus2012$fechld, type = "bar", title = "Attitude toward working mom",
        geom.colors = "darkolivegreen")  Change bar color
sjp.frq(aus2012$fechld, type = "bar", title = "Attitude toward working mom",
        show.values = FALSE)  do not show values
sjp.frq(aus2012$fechld, type = "bar", title = "Attitude toward working mom",
        show.prc = FALSE)  do not show percentages
sjp.frq(aus2012$fechld, 
        type = "bar", 
        title = "Attitude toward working mom",
        show.n = FALSE,
        coord.flip = TRUE)  do not show frequencies

 1.2 Stacked bar graph
sjp.stackfrq(aus2012$fechld)
sjp.stackfrq(aus2012$fechld, coord.flip = FALSE)  the x and y axis are swaped

sjp.stackfrq(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")])  plot many variables simultaneously
sjp.stackfrq(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
             title = "Attitude toward working women (or mom)")  Add the title

 1.3 Stacked bar graph for likert scale
plot_likert(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
           cat.neutral = 3)  'cat.neutral' means a neutral category such as "neither agree nor disagree".
plot_likert(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
           cat.neutral = 3, values = "hide")  hide the percentage values on the bars.
plot_likert(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
           cat.neutral = 3, title = "Attitude toward working women (or mom)")   Add the title
plot_likert(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
           cat.neutral = 3, coord.flip = FALSE)  the x and y axis are swaped; but you will see the variable name is so long; I will fix them in the next code.
plot_likert(aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")],
           cat.neutral = 3, coord.flip = FALSE, wrap.labels = 20)  'wrap.labels' determines how many characters are displayed in one line and when a line brek is inserted

 Also, I would like to tell you how to change variable names
wrkwm <- aus2012[, c("fechld", "fepresch", "famsuffr", "homekid", "housewrk")]  extract five variables
wrkwm$fechld <- set_label(wrkwm$fechld, label = "Q1a")  change the variable name
wrkwm$fepresch <- set_label(wrkwm$fepresch, label = "Q1b")
wrkwm$famsuffr <- set_label(wrkwm$famsuffr, label = "Q1c")
wrkwm$homekid <- set_label(wrkwm$homekid, label = "Q1d")
wrkwm$housewrk <- set_label(wrkwm$housewrk, label = "Q1e")

plot_likert(wrkwm, cat.neutral = 3)

 Note: if you want to change value labels, use 'set_labels()'.

 1.4 Grouped bar plot
sjp.xtab(aus2012$fechld, aus2012$sex)
sjp.xtab(aus2012$fechld, aus2012$sex, show.total = FALSE)  do not show the total.

sjp.xtab(aus2012$sex, aus2012$fechld, bar.pos = "stack", show.total = FALSE)
sjp.xtab(aus2012$sex, aus2012$fechld, bar.pos = "stack", show.total = FALSE,
         margin = "row", coord.flip = TRUE, show.n = FALSE)  'margin' specifies how percentages are calculated; 'row' indicates the row percentage; 'show.n = FALSE' will remove the total number of cases.
sjp.xtab(aus2012$sex, aus2012$fechld, bar.pos = "stack", show.total = FALSE,
         margin = "row", coord.flip = TRUE, show.n = FALSE, show.summary = TRUE)  show chi-square statistics
sjp.xtab(aus2012$sex, aus2012$fechld, bar.pos = "stack", show.total = FALSE,
         margin = "row", coord.flip = TRUE, show.n = FALSE,
         legend.title = "", 
         title = "Q1a Workimg mom: warm relationship with children as a not working mom",
         wrap.title = 70) remove the legend title; add the plot title; allow more characters in one line in the plot title
sjp.xtab(aus2012$sex, aus2012$fechld, bar.pos = "stack", show.total = FALSE,
         margin = "row", coord.flip = TRUE, show.n = FALSE,
         legend.title = "", 
         title = "Q1a Workimg mom: warm relationship with children as a not working mom",
         wrap.title = 70,
         geom.colors = c("burlywood4", "burlywood1", "darkgray", "darkolivegreen1", "darkolivegreen4"))  change colors for each category

 
 2. Box plot
 
 2.1 Simple box plot
aus2012$rhhwork <- set_label(aus2012$rhhwork, label = "Hours spent on household work")  set variable name
sjp.frq(aus2012$rhhwork, type = "box")
sjp.frq(aus2012$rhhwork, type = "box", ylim = c(0, 50))  reduce the range of y-axis.

 2.2 Grouped box plot
sjp.grpfrq(aus2012$rhhwork, aus2012$sex, type = "box")
sjp.grpfrq(aus2012$rhhwork, aus2012$sex, type = "box",  ylim = c(0, 50))

 2.3 3-way grouped box plot
sjp.grpfrq(aus2012$rhhwork, aus2012$sex, intr.var = aus2012$degree, type = "box")  value labels are long; I will change them

aus2012$degree <- set_labels(aus2012$degree, 
                             labels = c("Did not complete Yr 10" = 1,
                                    "Completed Yr 10" = 2,
                                    "Completed Yr 12" = 3,
                                    "Trade qualification or Apprenticeship" = 4,
                                    "TAFE or business college" = 5,
                                    "Bachelor degree" = 6,
                                    "Postgraduate degree" = 7))  reassign value labels
sjp.grpfrq(aus2012$rhhwork, aus2012$sex, intr.var = aus2012$degree, type = "box",
           wrap.labels = 8, ylim = c(0, 50)) 

 
 3. Histogram
 
sjp.frq(aus2012$age, type = "hist", title = "Distribution of Respondents' Age")
sjp.frq(aus2012$age, type = "hist", title = "Distribution of Respondents' Age",
        show.mean = TRUE)  show mean and standard deviation
sjp.frq(aus2012$age, type = "hist", title = "Distribution of Respondents' Age",
        show.mean = TRUE, normal.curve = TRUE)  Add the normal disribution curve.
sjp.frq(aus2012$age, type = "hist", title = "Distribution of Respondents' Age",
        show.mean = TRUE, normal.curve = TRUE, 
        normal.curve.color = "red", normal.curve.size = 3)  change the colour and the line width of the normal curve

 
 4. Scatter plot
 
aus2012$educyrs <- set_label(aus2012$educyrs, label = "Years of schooling")

 4.1 Simple scatter plot
plot_scatter(aus2012, educyrs, rhhwork)
plot_scatter(aus2012, educyrs, rhhwork, jitter = TRUE)  points are jittered to avoid overlapping.
plot_scatter(aus2012, educyrs, rhhwork, jitter = TRUE, fit.line = lm)  add the fitted line

 4.2 Grouped scatter plot
plot_scatter(aus2012, educyrs, rhhwork, sex, jitter = TRUE)  different colors by gender
plot_scatter(aus2012, educyrs, rhhwork, sex, jitter = TRUE,
            fit.grps = lm)  add the fitted line for each group
plot_scatter(aus2012, educyrs, rhhwork, sex, jitter = TRUE,
            fit.grps = lm, show.ci = TRUE)  show confidence intervals
plot_scatter(aus2012, educyrs, rhhwork, sex, jitter = TRUE,
            fit.grps = lm, show.ci = TRUE, grid = TRUE)  grouped scatter plot as facets
plot_scatter(aus2012, educyrs, rhhwork, sex, jitter = TRUE,
            fit.grps = lm, show.ci = TRUE, grid = TRUE,
            title = "Educational effects on household work by gender")  add the title

 4.3 Scatter plot with text label
plot_scatter(lga, giniinc, sexoff, dot.labels = lga$name3) #This is too busy
plot_scatter(lga, giniinc, sexoff, dot.labels = lga$name)

 
 5. Correlation matrix
 
var.index <- c("astdomviol", "astnondomviol", "sexoff", "robbery", "popden", "medinc", "giniinc", "unemploy")  make a list of variables for correlation matrix

sjp.corr(lga[,var.index])
sjp.corr(lga[,var.index], show.legend = TRUE)  show the legend for colours

 
 6. Regression
 
 data preparation
var.list <- c("fepresch", "famsuffr","rhhwork", "educyrs", "sex", "work", "topbot", "age", "marital", "id", "risei")  select variables.
mydata <- aus2012[, var.list]  make a dataset with the chosen variables
#------------
 In the next section the dplyr operator %>% is used. 
 For an introduction to the %>% operator see this:
 https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html 
#------------
mydata <- mydata %>%
            select(marital) %>%
            rec(rec = "1:2 = 1; 3:6 = 0") %>%  old value = new value; 3:6 means 3 to 6.
            add_columns(mydata)  recode 'marital' in a way that those currently married or in a partnership are coded as 1, otherwise as 0.
mydata <- mydata %>%
            select(marital_r) %>%
            to_factor() %>%
            add_columns(mydata)  convert the variable into a factor
mydata <- mydata %>%
            rename(currmarried = marital_r)  change the variable name into 'currmarried'.
#------------
mydata <- mydata %>%
            select(sex) %>%
            to_dummy() %>%
            add_columns(mydata)  make dummy variables for sex
mydata <- mydata %>%
            rename(male = sex_1, female = sex_2)  change the variable names
mydata <- mydata %>%
            select(male, female) %>%
            to_factor() %>%
            add_columns(mydata)  convert the variables into factors.
#------------
mydata <- mydata %>%
          select(work) %>%
          to_dummy() %>%
          add_columns(mydata)  make dummy variables for work
mydata <- mydata %>%
  rename(currwrk = work_1, pastwrk = work_2, nowrk = work_3)  change the variable names
mydata <- mydata %>%
  select(currwrk, pastwrk, nowrk) %>%
  to_factor() %>%
  add_columns(mydata)  convert the variables into factors.
#------------
mydata <- mydata %>%
          select(fepresch, famsuffr) %>%
          dicho(dich.by = 3) %>%
          add_columns(mydata)  'disagree" and "strongly disagree" are collapsed into 1, otherwise 0
mydata <- mydata %>%
  select(fepresch_d, famsuffr_d) %>%
  to_factor() %>%
  add_columns(mydata)  convert the variables into factors.

#------------
mydata$female <- set_label(mydata$female, label = "Female")
mydata$female <- set_labels(mydata$female, labels = c("Male"= 0, "Female" = 1))
mydata$currmarried <- set_label(mydata$currmarried, label = "Currently married or in a partnership")
mydata$age <- set_label(mydata$age, label = "Age")
mydata$educyrs <- set_label(mydata$educyrs, label = "Years of schooling")
mydata$topbot <- set_label(mydata$topbot, label = "Class")
mydata$currwrk <- set_label(mydata$currwrk, label = "Currently working")
mydata$rhhwork <- set_label(mydata$rhhwork, label = "Hours spent on household working")
mydata$fepresch_d <- set_label(mydata$fepresch_d, label ="Attitude toward working mom: disagree with the statement that preschool child is likely to suffer.")
#------------
 
 6.1 lm model - OLS regression model
mod1 <- lm(rhhwork ~ educyrs + age + topbot + female + currmarried + currwrk, data = mydata)
summary(mod1)

mod2 <- lm(rhhwork ~ age + educyrs * female, data = mydata)
summary(mod2)

 Forest plot (coefficient and its confidence intervals)
plot_model(mod1, type = "est")
plot_model(mod1, type = "est", remove.estimates =  c("educyrs", "age", "topbot"))  remove estimates for 'educyrs", "age' and "topbot'
plot_model(mod1, type = "std")  forest-plot with standardized coefficients

 Plot predicted values
plot_model(mod1, type = "pred", terms = "educyrs")
plot_model(mod1, type = "pred", terms = "female")
plot_model(mod1, type = "pred", terms = "female", geom.size = 1.1)  increase the width of the fitted line

 Plot interaction effect
plot_model(mod2, type = "int")

 
 6.2 glm model - logistic regression
 
 logit model
mod3 <- glm(fepresch_d ~ age + educyrs + female, data = mydata, family = "binomial")
summary(mod3)

mod4 <- glm(fepresch_d ~ age + educyrs * female, data = mydata, family = "binomial")
summary(mod4)

 Odds ratio plot
plot_model(mod3, type = "est", wrap.title = 100)

 Plot predicted values
plot_model(mod3, type = "pred", terms = "educyrs")
plot_model(mod3, type = "pred", terms = "age")
plot_model(mod3, type = "pred", terms = "female")

 Plot interaction effect
plot_model(mod4, type = "int")
