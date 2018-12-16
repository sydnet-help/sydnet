---
title: "Lesson5: Constructing and testing an index (Cronbach Alpha)"
keywords: how_to_analyse_data
tags: 
sidebar: mydoc_sidebar
permalink: htad_lesson_05.html
summary: "If you have done a survey, chances are you have many different questions which test for the same underlying theoretical concept. When you have this situation, often the best thing to do is to construct an index. There are generally three stages to constructing an index: (1) getting all variables onto the same scale (generally done with normalization); and (2) checking that scales are all moving together in a reliable fashion (generally done by measuring the Cronbach Alpha and making sure it is > 0.6); and (3) adding together all the variables into a new variable – the index."
---

### STEP 1: Getting all variables into the same scale (normalization).

If our variables aren’t measured on the same scale, then the easiest thing to do is to normalize the variables. 

1)  Get the descriptive statistics for your variables: Analyse>Descriptive Statistics>Descriptives

<div style="text-align:center"><img src ="images/htad_lesson_05_image_01.png" style="max-width:60%;" /></div>
 
2)  Write down the mean and standard deviation for each variable. 

3)  Go to Transform>Compute Variable

<div style="text-align:center"><img src ="images/htad_lesson_05_image_02.png" style="max-width:60%;" /></div>

4)  In the dialogue box that comes up, type in a new target variable (in this case v16_normalized), and the normalizing equation: Anormalised = (A – MeanA)/St DevA
Press OK

<div style="text-align:center"><img src ="images/htad_lesson_05_image_03.png" style="max-width:60%;" /></div>
 
A new variable will have been created. Take a look and make sure it looks like it has a mean of 0.

<div style="text-align:center"><img src ="images/htad_lesson_05_image_04.png" style="max-width:60%;" /></div>
 
5.  Repeat this process of normalisation with your other variables.

### STEP 2: Checking that the variables move together reliably (Checking the Cronbach Alpha)

1)  Analyze > Scale > Reliability Analysis

<div style="text-align:center"><img src ="images/htad_lesson_05_image_05.png" style="max-width:60%;" /></div>

2)  Move the new normalized variables to the right side. Then click OK.

<div style="text-align:center"><img src ="images/htad_lesson_05_image_06.png" style="max-width:60%;" /></div>
 
3)  Read the Cronbach’s Alpha from the output screen.

How to read this output? The normal cut off for most indexes is 0.6, though it is always better if it is higher than this.

<div style="text-align:center"><img src ="images/htad_lesson_05_image_07.png" style="max-width:60%;" /></div>
 
4)  If you are interested, at this stage you can check to see how much the normalization improved the Cronbach’s Alpha by running the same test on your original variables (in our case v16 and v17)

You can see that the Cronbach’s Alpha for our original variables was only 0.36

<div style="text-align:center"><img src ="images/htad_lesson_05_image_08.png" style="max-width:60%;" /></div>
 
### STEP 3: Create the index

1)  You now create the index by going back to Compute Variable:

<div style="text-align:center"><img src ="images/htad_lesson_05_image_09.png" style="max-width:60%;" /></div>
 
2)  Create a new variable called ‘index###’ by summing the normalized variables.
 
<div style="text-align:center"><img src ="images/htad_lesson_05_image_10.png" style="max-width:60%;" /></div>
 
