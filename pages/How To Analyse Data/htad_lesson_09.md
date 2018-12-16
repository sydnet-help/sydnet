---
title: "Lesson 9: Cleaning up Data with Word and Excel"
keywords: how_to_analyse_data
tags: 
sidebar: mydoc_sidebar
permalink: htad_lesson_09.html
summary: "Something else you may need to do is clean up your data in Word, Excel, or Notepad. This section gives some basic tips."
---

### Lesson 9.1: Ways to strip out formatting

#### Option 1:

1) Open Excel

2) Press Ctrl+A  (Command if Mac) or Press the top left button+ Right click +copy

3) Go to sheet 2

4) Right click and past values 

<div style="text-align:center"><img src ="images/htad_lesson_09_image_01.png" style="max-width:60%;" /></div>
 
#### Option 2:

1) Open Excel

2) Press Ctrl+A (Command if Mac) or Press the top left button+ Right click +copy

3) Open Word

4) Right click and paste values in Word

5) Select all and copy and past back to excel

#### Option 3:

1) Open Excel

2) Press Ctrl+A (Command if Mac) or Press the top left button+ Right click +copy

3) Open Notepad

4) Right click and paste into Notepad

5) Select all and copy and past back to excel

### Lesson 9.2: Use of TAB in Word to create columns in Excel

1)  Select All in Excel and copy

2)  Paste values in word (You must paste VALUES)

3)  Use Find (Ctrl +H ; Shift+ Command +H for Mac)

1.  Find @ and replace with ^t (This means find all @ in email addresses and replace with a tab; which will be a column space in Excel) 
 
2.  Find .smu.edu.sg and replace with ^t

3.  Find .20 and replace with ^t

<div style="text-align:center"><img src ="images/htad_lesson_09_image_02.png" style="max-width:60%;" /></div>

<div style="text-align:center"><img src ="images/htad_lesson_09_image_03.jpg" style="max-width:60%;" /></div>

4)  Copy and paste everything back to excel 

<div style="text-align:center"><img src ="images/htad_lesson_09_image_04.jpg" style="max-width:60%;" /></div>

### Lesson 9.3: Binarizing Categorical Variables

1)  Check Excel file for any mistake and manually delete or correct (Audit Students; etc)

2)  Move the “Role” column right about 10 columns

<div style="text-align:center"><img src ="images/htad_lesson_09_image_05.jpg" style="max-width:60%;" /></div>

3)  Select column of majors ( The column under “Last Accessed”)

4)  Copy and past a new copy

5)  Remove duplicates

6)  Sort A-Z (Ascending) 

<div style="text-align:center"><img src ="images/htad_lesson_09_image_06.png" style="max-width:60%;" /></div>

7)  Copy + paste special: Transpose as headings

8)  In the first cell type: =if($E3=f$2,1,0)

9)  Paste down all cells (Either drag cells or highlight and use the ctrl+d shortcut) 

<div style="text-align:center"><img src ="images/htad_lesson_09_image_07.jpg" style="max-width:60%;" /></div>


<div style="text-align:center"><img src ="images/htad_lesson_09_image_08.jpg" style="max-width:60%;" /></div>


<div style="text-align:center"><img src ="images/htad_lesson_09_image_09.jpg" style="max-width:60%;" /></div>

### Notes

^t= tab

^p= paragraph mark

You can use XXX as a placeholder sometimes between Find & Replace

E.g. Text that has had a paragraph mark inserted at the end of every line (fwded emails) can be rejuvenated with the following commands:

1.  Find and replace ^p ^p with xxxx
2.  Find and replace ^p with [blank]
3.  Find and replace xxxx with ^p
