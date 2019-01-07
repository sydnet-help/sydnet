+++
title = "Lesson 6: Linear Regression"

date = 2018-12-30T00:00:00
# lastmod = 2018-12-30T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "Lesson 6: Linear Regression"
[menu.docs]
  parent = "How to Analyse Data"
  weight = 80
+++

Summary: We generally use linear regressions when we have (1) a dependent variable that is continuous (or a scale, or an index, or a count), and (2) we want to test the impact of (and/or control for) multiple independent variables. The ‘unstandardized coefficients’ for each independent variable - also called B - can be read as “For a one unit increase in the independent variable, the dependent variable goes up by B units, controlling for all other variables in the model.” 


## Introduction

We generally use **linear regressions** when we have (1) a **dependent variable** that is continuous (or a scale, or an index, or a count), and (2) we want to test the impact of (and/or control for) multiple **independent variables**. 

The process of running a regression in SPSS is relatively straight-forward. 

STEP 1: You put your dependent variable in one field, and then you have three main options for putting in your independent variables: you can put them in all at once (**forced entry**), you can put them in as sets (**hierarchical**), or you can put them all in and then drop out the non-significant results (a **stepwise method** called **backwards selection**). 

When you read your results from a regression, there are two main columns you read: the ‘**unstandardized coefficients**’ for **B**; and the **significance** (sig.). You can ignore all coefficients for which sig. > 0.05. Coefficients where the sig. < 0.05 are interpreted as:

**“For a one unit increase in the independent variable, the dependent variable goes up by B units, controlling for all other variables in the model.”** 

STEP 2: You also want to look for the **R-square**: this is the proportion of variation in the dependent variable explained by the independent variables in the model. 

## STEP 1A: Running a regression with FORCED ENTRY of independent variables

1)  Select Analyze > Regression > Linear

{{< figure library="1" src="htad_lesson_06_image_01.png" >}}

2)  Select the dependent variable and put it in the top box

3)  Select the independent variables and put these in the “Independent(s)” box.

{{< figure library="1" src="htad_lesson_06_image_02.png" >}}
 
4)  Press OK. The regression will run and the output screen will appear

5)  You can then interpret the coefficients of the regression.

  a. Look in the ‘Sig.’ column for the p-values 
  b. If the p-value < 0.05 then the independent variable has a significant impact on the dependent variable
  c. For the significant variables, we then read the B values (coefficients), which are the effect of a one unit increase of the independent variable on the dependent variable.
  d. In this case the dependent variable is a 7 point scale from “Never” (1) to “Extremely Often” (7). 
  e. Gender is 1 if the person is a woman and 0 if they are a man. Note that the B coefficients state that women answer, on average, 2.20 points lower on this scale than men.
  f. Nationality is 1 if the person is Singaporean. It has no significant effect.
  g. Age is measured in years. Older people are more likely to masturbate, raising the score by 0.085 for each year of age.

{{< figure library="1" src="htad_lesson_06_image_03.png" >}}

## STEP 1B: Running a regression with HEIRARCHICAL entry of independent variables

1)  Select Analyze > Regression > Linear

2)  Select the dependent variable and put it in the top box

3)  When you run HEIRARCHICAL models, you need to divide your independent variables into groups.

Select the FIRST SET of independent variables and put these in the “Independent(s)” box

{{< figure library="1" src="htad_lesson_06_image_04.png" >}}

4)  Press the “Next” button. The independent variables box will clear.

5)  Select the SECOND SET of independent variables and put these in the “Independent(s)” box

{{< figure library="1" src="htad_lesson_06_image_05.png" >}} 

6)  Press the “Next” button. The independent variables box will clear.

7)  Select the THIRD SET of independent variables and put these in the “Independent(s)” box

{{< figure library="1" src="htad_lesson_06_image_06.png" >}}

6)  Press OK. The regression will run and the output screen will appear

7)  How do you interpret a hierarchical linear regression?

The simplest way to think about it is that each of Model 1, Model 2, and Model 3 are completely separate FORCED ENTRY models.

The coefficients for each variable in the three models are interpreted as “controlling for all the other variables in the model”. The difference with the later models (like Model 3) is that there are more controls (and more variables with coefficients).

So how would we interpret this set of models? 

  a.  Look in the ‘Sig.’ column for the p-values

  b.  If the p-value < 0.05 then the independent variable has a significant impact on the dependent variable

  c.  For the significant variables, we then read the B values (coefficients), which are the effect of a one unit increase of the independent variable on the dependent variable.

  d.  In this case the dependent variable is a scale from “Never” to “Extremely Often”.

  e.  Let’s look at the transition of one variable – age – over the three models. 
   i.  In models 1 and 2, age is statistically significant (Sig. column p, 0.05). 

   ii. In model 3, age just drops out of statistical significance (p = 0.051). Why? Because we added the variable “I feel guilty when I have sex”. This variable turns out to be highly statistically significant: the guiltier a person is, the less they masturbate (or the less they report masturbating).

   iii.  The fact that age loses significance when we add ‘guilt’ suggests that the variables are related, and the simplest interpretation is this: 

> “The older a person is, the more they masturbate, but the reason that they masturbate more is that they feel less guilt. Once we control for guilt, there is no effect of age on masturbation. Older people are probably less guilty, and older people masturbate more, but they do so because they are less guilty, not because of their age per se.”

{{< figure library="1" src="htad_lesson_06_image_07.png" >}}
 
## STEP 1C: Running a STEPWISE regression

**WARNING: YOU SHOULD PROBABLY NOT BE RUNNING A STEPWISE REGRESSION
WHY? BECAUSE THEY ARE A-THEORETICAL, AND SO PRONE TO MASSIVE CONCEPTUAL FLAWS.**

Let me show you through an example:

1)  Select Analyze > Regression > Linear

2)  Select the dependent variable and put it in the top box

3)  When you run STEPWISE models, you tend to put a lot of variables into the model. You don’t generally have multiple blocks.

Select the independent variables and put these in the “Independent(s)” box

{{< figure library="1" src="htad_lesson_06_image_08.png" >}}
 
4)  Under the independent variables, there is the label “Method”. Select “Backward” from the dropdown menu.

5)  Click on “Options”.

This will reveal the options for ‘Stepping’. Because we are doing “Backwards selection”, you can just look at the “Removal” box. Variables with Significance (p-value) greater than 0.10 will be removed from the model, one at a time. If you want you can adjust this up or down.
Press ‘Continue’. Then press OK and run the model

{{< figure library="1" src="htad_lesson_06_image_09.png" >}}
 
6)  How do you interpret stepwise linear regression?

First you need to wade through the huge mass of output.

The way a stepwise backwards selection regression works is that SPSS estimates a complete model with all the variables, and then if any variables have a significance of greater than 0.10, then it removes the one with the highest p-value (i.e. the least significant variable is removed). It then re-estimates the model, and repeats this process until only variables with p-values < 0.10 are left.

So generally we interpret a STEPWISE model by just interpreting the LAST model as a FORCED ENTRY model. 

Here are the last two models for our example. Notice the 21 and 22 next to the word (Constant). These are the model numbers, and this means that the method has dropped out 21 variables before getting to the final model.

So how would we interpret this set of models? 

  a.  Look in the ‘Sig.’ column for the p-values

  b.  If the p-value < 0.05 then the independent variable has a significant impact on the dependent variable

  c.  Almost all the variables are significant at p < 0.05 level. But does this mean that we should SAY that these variables are significant CAUSE of masturbation?

  Well take a look at the variables “v16 Have you masturbated”. This is positive and of large magnitude, but is it really a causal variable? Does it make sense to “If you have masturbated you are like to masturbate more.” Maybe, but you would need to make a strong argument.

  **THIS IS THE PROBLEM WITH STEPWISE MODELS: THEY DON’T DO THE THINKING FOR YOU, AND IF YOU GIVE IT SILLY MODELS, IT WILL STILL RUN THEM.**

{{< figure library="1" src="htad_lesson_06_image_10.png" >}}
 
## STEP 2: Interpreting the R-square

The R-square is a summary measure of goodness of fit that refers to the proportion of variation in the dependent variable that can be explained by the independent variable. 

* R-square is between 0 and 1.
* The higher the score, the better it is.

With this measure, you can say, “Approximately XXX% of the model can be explained by the independent variable.
 
### STEP 3: Reporting Results

The key thing to say here is: **DO NOT JUST CUT AND PASTE THE TABLES FROM SPSS INTO YOUR PAPER OR PRESENTATION.**

You need to be selective about what you present, and you need to make it look neat and nice!

I am going to set a rule for what I want to see. I only want to see:
• B coefficients
• Sig./p-values
• The number of cases in your sample (n)
• The R-square for your model

Here is an example of a table of the models produced by the hierarchical method..

 
{{< figure library="1" src="htad_lesson_06_image_11.png" >}}

