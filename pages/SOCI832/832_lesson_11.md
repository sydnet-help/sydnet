---
title: "Lesson 11: Factor Analysis"
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_11.html
summary: "This week we are going to ..."
---

*Last updated: 22 Oct 2018*

## Reference

* Chapter 17: Exploratory Factor Analysis in Field, Miles, and Field, 2012. Discovering Statistics Using R.
 

## preparation

update.packages(ask = FALSE)
if (!require("corpcor")) install.packages("corpcor", dependencies = TRUE)
if (!require("GPArotation")) install.packages("GPArotation", dependencies = TRUE)
if (!require("psych")) install.packages("psych", dependencies = TRUE)
if (!require("dplyr")) install.packages("dplyr", dependencies = TRUE)
if (!require("ggrepel")) install.packages("ggrepel", dependencies = TRUE)
if (!require("sjlabelled")) install.packages("sjlabelled", dependencies = TRUE)
if (!require("sjmisc")) install.packages("sjmisc", dependencies = TRUE)
if (!require("sjPlot")) install.packages("sjPlot", dependencies = TRUE)
library(corpcor)
library(GPArotation) 
library(psych)
library(dplyr)
library(ggrepel)
library(sjlabelled)
library(sjmisc) 
library(sjPlot)

**Turn off scientific notation**
To turn back on type: options(scipen = 0)

	options(scipen = 999)

**data**
Load the AuSSA Dataset

	aus2012 <- readRDS(url("https://mqsociology.github.io/learn-r/soci832/aussa2012.RDS"))

Load the Crime Dataset

	lga <- readRDS(url("https://mqsociology.github.io/learn-r/soci832/nsw-lga-crime.RDS"))

Extract just the crimes

	first <- which( colnames(lga)=="astdomviol" )
	last <- which(colnames(lga)=="transport")
	crimes <- lga[, first:last ]

## Factor analysis

### (Step 1) Determine how many factors to extract.

Note that there are three or four different methods used in the literature:
 1. Number of factors whose eigenvalues > 1
 2. Number of factors whose eigenvalues are above the point of inflection
 3. Number of factors whose eigenvalues above simulated dataset with no factors

Option 3 is the best.

	fa.parallel(crimes, fm="pa", fa="fa", use="pairwise")

### (Step 2) Choose a factoring method

Options:
 1. Maximum Likelihood "ml"
 2. Alpha "alpha"
 3. Ordinary Least Squares "ols"
 4. Minimum residual "minres"
 5. Principle axis factoring "pa"

 It's probably safest to use "pa" or "ml"

### (Step 3) Choose a rotation method
Options: 
A. ORTHOGONAL ROTATIONS
 1. "none"
 2. "varimax"
 3. ... others, but varimax is the main one people use.
B. OBLIQUE ROTATIONS
 1. "promax"
 2. "oblimin"
 3. ... others, but these are the two that most people recommend


### (Step 4) Run the factor analysis

		results.1 <- fa(r = crimes, nfactors = 3, rotate = "promax", fm="pa")
		results.1

### (Step 5) Visualise the factors

	fa.diagram(results.1)

### (Step 6) Test the reliability of the factors

Reliability analysis for FACTOR MR1

	f <- crimes[,c(which( colnames(crimes)=="mottheft" ),
               which( colnames(crimes)=="arson" ),
               which( colnames(crimes)=="steafrmot" ),
               which( colnames(crimes)=="brkentdwel" ),
               which( colnames(crimes)=="damtoprpty" ),
               which( colnames(crimes)=="steafrdwel" ), 
               which( colnames(crimes)=="robbery" ),
               which( colnames(crimes)=="trespass" ),
               which( colnames(crimes)=="weapon" ),
               which( colnames(crimes)=="offlang" ),
               which( colnames(crimes)=="sexoff" ),
               which( colnames(crimes)=="brchavo" ),
               which( colnames(crimes)=="astdomviol" ),
               which( colnames(crimes)=="hrssthreat" ),
               which( colnames(crimes)=="brchbailcon" ),
               which( colnames(crimes)=="rsthindofficer" ),
               which( colnames(crimes)=="astnondomviol" ))]
	psych::alpha(f)

Reliability analysis for FACTOR MR2

	f <- crimes[,c(which( colnames(crimes)=="fraud" ),
               which( colnames(crimes)=="steafrprsn" ),
               which( colnames(crimes)=="steafrsto" ),
               which( colnames(crimes)=="transport" ),
               which( colnames(crimes)=="oththeft" ),
               which( colnames(crimes)=="recvstlgoods" ))]
	psych::alpha(f)

Note these results show that we should remove 'transport' from scale.

Reliability analysis for FACTOR 3

	f <- crimes[,c(which( colnames(crimes)=="liqoff" ),
               which( colnames(crimes)=="offcond" ),
               which( colnames(crimes)=="marijuana" ))]
	psych::alpha(f)

We could just do this all with one command

	sjt.fa(crimes, nmbr.fctr = 3, rotation = c("promax"), method="minres")

	f <- crimes
	f[is.na(f)] <- 0
	my.scores <-factor.scores(f, results.1)
	g <- cbind(crimes, my.scores$scores)
	g <- g[,c(which( colnames(g)=="mottheft" ),
	               which( colnames(g)=="arson" ),
	               which( colnames(g)=="steafrmot" ),
	               which( colnames(g)=="brkentdwel" ),
	               which( colnames(g)=="damtoprpty" ),
	               which( colnames(g)=="steafrdwel" ), 
	               which( colnames(g)=="robbery" ),
	               which( colnames(g)=="trespass" ),
	               which( colnames(g)=="weapon" ),
	               which( colnames(g)=="offlang" ),
	               which( colnames(g)=="sexoff" ),
	               which( colnames(g)=="brchavo" ),
	               which( colnames(g)=="astdomviol" ),
	               which( colnames(g)=="hrssthreat" ),
	               which( colnames(g)=="astnondomviol" ),
	               which( colnames(g)=="brchbailcon" ),
	               which( colnames(g)=="rsthindofficer" ),
	               which( colnames(g)=="fraud" ),
	               which( colnames(g)=="steafrprsn" ),
	               which( colnames(g)=="steafrsto" ),
	               which( colnames(g)=="recvstlgoods" ),
	               which( colnames(g)=="oththeft" ),
	               which( colnames(g)=="liqoff" ),
	               which( colnames(g)=="offcond" ),
	               which( colnames(g)=="marijuana" ),
	               which( colnames(g)=="transport" ),
	               which( colnames(g)=="PA1"),
	               which( colnames(g)=="PA2"),
	               which( colnames(g)=="PA3"))]

This is ugly because it includes the values of the correlations

	sjp.corr(g, show.legend = TRUE, sort.corr= FALSE)

This makes a nice pretty picture

	sjp.corr(g, show.legend = TRUE, show.values = FALSE, show.p = FALSE,
         sort.corr= FALSE)

This creates the same figure, but with only the lower triangle of the correlations

	sjt.corr(g, triangle = "lower")

If you are finding the variable labels annoying, this code will replace them with the variable names

	for(i in 1:ncol(g)) {
	  		set_label(g[i]) <- colnames(g[i])
	}

#### Example 2: AES 2013

	library(readr)
	aes_full <- read_csv("C:/G/2018, SOCI832/Datasets/AES 2013/aes_full.csv")

	first <- which( colnames(aes_full)=="d1tax" )
	last <- which(colnames(aes_full)=="d1econo")
	attitudes1 <- aes_full[, first:last ]

	first <- which( colnames(aes_full)=="e6deathp" )
	last <- which(colnames(aes_full)=="e6opp")
	attitudes2 <- aes_full[, first:last ]

	attitudes <- cbind(attitudes1, attitudes2)

	fa.parallel(attitudes, fm="pa", fa="fa", use="pairwise")

	results.1 <- fa(r = attitudes, nfactors = 7, rotate = "promax", fm="pa")
	results.1

	fa.diagram(results.1)


