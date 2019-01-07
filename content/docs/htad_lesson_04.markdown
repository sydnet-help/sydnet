+++
title = "Lesson 4: Experiments and Simple Tests (T-test)"

date = 2018-12-30T00:00:00
# lastmod = 2018-12-30T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "Lesson 4: Experiments and Simple Tests (T-test)"
[menu.docs]
  parent = "How to Analyse Data"
  weight = 60
+++

Summary: If you have quantitative data that is the result of an experiment, or which is basically a comparison of the mean values of a variable in two groups, then you are most likely to want to use a t-test. This will tell you whether the difference in the mean values of the variable for the two groups is statistically significant.

## 4.1 Independent Samples t-test

This test is used when there are two experimental conditions and different participants were assigned to each condition.

1)  Go to Analyze under the function bar

2)  Select Compare Means

3)  Select Independent-Samples T test

{{< figure library="1" src="htad_lesson_04_image_01.png" >}}

4)  Select THE DEPENDENT VARIABLE as the test variable and GROUPING VARIABLE as the grouping variable using the buttons in the middle

5)  Click the “Define Groups” button 

{{< figure library="1" src="htad_lesson_04_image_02.png" >}}

6)  Normally we define Group 1 as 0 and Group 2 as 1 

7)  Click the Continue button

8)  Click the OK button

{{< figure library="1" src="htad_lesson_04_image_03.png" >}}

9)  Results which look like the following will be produced:
 
{{< figure library="1" src="htad_lesson_04_image_04.png" >}}

10) How do you interpret these results?

Here is a quick summary: 

1. Look at Levene’s test for equality of variance
   1. If P <= 0.05, then it’s significant. Look at the Equal variances are not assumed row
   2. If P > 0.05, then it’s not significant. Look at the Equal variances are assumed row
2. Look at the T test
   1. Check if p is less than or greater than 0.05
   2. If P <= 0.05, then it’s significant 
   3. If P > 0.05, then it’s not significant 
3. If significant, we conclude that there is a significant difference between the means of these two samples. 

In this particular case, equal variances is not assumed row (Leven’s test = .000). We conclude that there is a significant difference between virgins and non-virgins in their comfort level of doing the survey (T test= .000)
 
## 4.2 Paired Samples t-test

The Paired-Samples T Test procedure compares the means of two variables for a single group. The procedure computes the differences between values of the two variables for each case and tests whether the average differs from 0.

This is typically used when you employ a repeated measures design where you are testing the same people twice: you give the same person a pre-test followed by a post-test and then you compare the scores at two different times.

1)  Go to Analyze under the function bar

2)  Select Compare Means

3)  Select Paired-Samples T test

{{< figure library="1" src="htad_lesson_04_image_05.png" >}}

4)   Select DEPENDENT VARIABLE MEASURE 1 as Variable 1 

5)   Select DEPENDENT VARIABLE MEASURE 2 as Variable 2

6)  Click the OK button
 
{{< figure library="1" src="htad_lesson_04_image_06.png" >}}

7)  You will get output like the following: 
 
{{< figure library="1" src="htad_lesson_04_image_07.png" >}}

8)  How do you interpret these?

Check Sig. 2-tailed: If value of p is less than 0.05, we can conclude that there was a significant difference between the means of these two samples. If greater, there is no significant difference.

In this example, the significance was 0.003, which is less than 0.05. We conclude that there is a significant difference between the means.

