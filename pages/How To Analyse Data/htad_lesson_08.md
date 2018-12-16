---
title: "Lesson 8: Recode and Select Cases"
keywords: how_to_analyse_data
tags: 
sidebar: mydoc_sidebar
permalink: htad_lesson_08.html
summary: "A couple of other useful axillary functions you may want to use in SPSS are (1) Recode into same variable; (2) Recode into different variables; and (3) Select cases."
---

### Lesson 8.1: Recode into same variable

Say we want to recode into same variable so as to change missing values to 999.

1)  Select Transform under the function bar

2)  Select Recode into Same Variables

<div style="text-align:center"><img src ="images/htad_lesson_08_image_01.jpg" style="max-width:60%;" /></div>

3)  Select v33. virginswithdoublebed

4)  Click “Old and New Values…”

<div style="text-align:center"><img src ="images/htad_lesson_08_image_02.jpg" style="max-width:60%;" /></div>

5)  Select System-missing under “Old Value”

6)  Select value under “New Value”

7)  Input 999

8)  Click “Add”

9)  Click the Continue button

<div style="text-align:center"><img src ="images/htad_lesson_08_image_03.png" style="max-width:60%;" /></div>

10) Click the OK button

11) SPSS changes the missing values to 999

<div style="text-align:center"><img src ="images/htad_lesson_08_image_04.jpg" style="max-width:60%;" /></div>
 
### Lesson 8.2: Recode into different variable

Now instead of changing the missing values to 999, we want to recode to a different variable (column). We want to create v33b. virginswithdoublebed2.

1)  Select Transform under the function bar

2)  Select Recode into Different Variables...

<div style="text-align:center"><img src ="images/htad_lesson_08_image_05.jpg" style="max-width:60%;" /></div>

3)  Select v33. Virginswithdoublebed

4)  Click “Old and New Values…”

<div style="text-align:center"><img src ="images/htad_lesson_08_image_06.png" style="max-width:60%;" /></div>

5)  Add the following:

 *  Old Value: 0; New Value: Copy old value(s)

 *  Old Value: 1; New Value: Copy old value(s)

 *  Old Value 999; New Value: Copy old value(s)

6)  Click the continue button

<div style="text-align:center"><img src ="images/htad_lesson_08_image_07.png" style="max-width:60%;" /></div>

7)  Input v33b. virginswithdoublebed2 under Name: in the Output Variable Section

8)  Click the Change button

9)  Click the OK button

10) SPSS recodes the variable into a new variable 

<div style="text-align:center"><img src ="images/htad_lesson_08_image_08.jpg" style="max-width:60%;" /></div>

<div style="text-align:center"><img src ="images/htad_lesson_08_image_09.jpg" style="max-width:60%;" /></div>

### Lesson 8.3: Select Cases

SPSS allows us to select part of the data set for further analysis, while excluding the remaining cases from these analyses. We will now perform analyzes on only females. We select the data to include only females:

1)  Select Data under the function bar

2)  Select “Select Cases…”

<div style="text-align:center"><img src ="images/htad_lesson_08_image_10.jpg" style="max-width:60%;" /></div>

3)  Click the “If…” button.

<div style="text-align:center"><img src ="images/htad_lesson_08_image_11.jpg" style="max-width:60%;" /></div>

4)  Select v31. Gender

5)  Input V31. Gender = 1 (Female only) 

<div style="text-align:center"><img src ="images/htad_lesson_08_image_12.jpg" style="max-width:60%;" /></div>

6)  Only cases that are female (Gender=1) are not selected. Notice that cases that are not female have their case number crossed out and that SPSS has added a new filter variable that is equal to 0 for cases not counted and equal to 1 for cases that are counted.

<div style="text-align:center"><img src ="images/htad_lesson_08_image_13.jpg" style="max-width:60%;" /></div>
