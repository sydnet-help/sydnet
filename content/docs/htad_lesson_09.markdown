+++
title = "Lesson 9: Cleaning up Data with Word and Excel"

date = 2018-12-30T00:00:00
# lastmod = 2018-12-30T00:00:00

draft = false  # Is this a draft? true/false
toc = false  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "Lesson 9: Cleaning up Data with Word and Excel"
[menu.docs]
  parent = "How to Analyse Data"
  weight = 110
+++


{{% toc %}}


Summary: Something else you may need to do is clean up your data in Word, Excel, or Notepad. This section gives some basic tips.

## Lesson 9.1: Ways to strip out formatting

#### Option 1:

1) Open Excel

2) Press Ctrl+A  (Command if Mac) or Press the top left button+ Right click +copy

3) Go to sheet 2

4) Right click and past values 

{{< figure library="1" src="htad_lesson_09_image_01.png" >}}

 
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

## Lesson 9.2: Use of TAB in Word to create columns in Excel

1)  Select All in Excel and copy

2)  Paste values in word (You must paste VALUES)

3)  Use Find (Ctrl +H ; Shift+ Command +H for Mac)

1.  Find @ and replace with ^t (This means find all @ in email addresses and replace with a tab; which will be a column space in Excel) 
 
2.  Find .smu.edu.sg and replace with ^t

3.  Find .20 and replace with ^t

{{< figure library="1" src="htad_lesson_09_image_02.png" >}}

{{< figure library="1" src="htad_lesson_09_image_03.jpg" >}}

4)  Copy and paste everything back to excel 

{{< figure library="1" src="htad_lesson_09_image_04.jpg" >}}

## Lesson 9.3: Binarizing Categorical Variables

1)  Check Excel file for any mistake and manually delete or correct (Audit Students; etc)

2)  Move the “Role” column right about 10 columns

{{< figure library="1" src="htad_lesson_09_image_05.jpg" >}}

3)  Select column of majors ( The column under “Last Accessed”)

4)  Copy and past a new copy

5)  Remove duplicates

6)  Sort A-Z (Ascending) 

{{< figure library="1" src="htad_lesson_09_image_06.png" >}}

7)  Copy + paste special: Transpose as headings

8)  In the first cell type: =if($E3=f$2,1,0)

9)  Paste down all cells (Either drag cells or highlight and use the ctrl+d shortcut) 

{{< figure library="1" src="htad_lesson_09_image_07.jpg" >}}


{{< figure library="1" src="htad_lesson_09_image_08.jpg" >}}


{{< figure library="1" src="htad_lesson_09_image_09.jpg" >}}

## Notes

^t= tab

^p= paragraph mark

You can use XXX as a placeholder sometimes between Find & Replace

E.g. Text that has had a paragraph mark inserted at the end of every line (fwded emails) can be rejuvenated with the following commands:

1.  Find and replace ^p ^p with xxxx
2.  Find and replace ^p with [blank]
3.  Find and replace xxxx with ^p
