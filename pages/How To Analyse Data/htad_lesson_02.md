---
title: "Lesson 2: Downloading your data and making a codebook"
keywords: how_to_analyse_data
tags: 
sidebar: mydoc_sidebar
permalink: htad_lesson_02.html
summary: Before you analyse a quantitative dataset you need to (Step 1) download the data (generally from Qualtrics), (Step 2) make a codebook and then (Step 3) import your data into SPSS.

---

### STEP 1 - How to download your data from Qualtrics 

1) Go to https://smusg.asia.qualtrics.com/ControlPanel/

2) Type in your User ID and password

3) Click the Login button

<div style="text-align:center"><img src ="images/htad_lesson_02_image_01.png" style="max-width:60%;" /></div>

4) After logging in, scroll down 

5) Click on the name of the survey you want to work on

<div style="text-align:center"><img src ="images/htad_lesson_02_image_02.png" style="max-width:60%;" /></div>

6)  Click the “Reporting” tab

<div style="text-align:center"><img src ="images/htad_lesson_02_image_03.png" style="max-width:60%;" /></div>

7)  Click the “Download Data” icon
 
<div style="text-align:center"><img src ="images/htad_lesson_02_image_04.png" style="max-width:60%;" /></div>

8)  We want to download 2 versions of the data

a.  Coded values where data is seen as 0,1,2,3 for analysis in SPSS after clean up

b.  Choice text so we know what the 0 or 1 in the coded values version means. E.g. 0=Male; 1=Female

9)  Leave file format as CSV

10) Go to Data representation and select coded values

11) Click the “ Download CSV Data” button

12) Save dataset as DS#1

13) Go to Data representation and select choice text

14) Click the “ Download CSV Data” button

15) Save dataset as DS#2

<div style="text-align:center"><img src ="images/htad_lesson_02_image_05.png" style="max-width:60%;" /></div>


### STEP 2 - Creating a codebook
A codebook enables other people to understand your data. They will know the descriptive statistics and how each variable is coded.
There are examples of codebooks that you can use as models in the Dropbox under the folder:

• /Week 11 and 12 – Datasets/

<div style="text-align:center"><img src ="images/htad_lesson_02_image_06.png" style="max-width:60%;" /></div>

  
The sections of a codebook:

1)  Introduction

This is a description of the data set, how and when it is collected and what the purposes of collecting the data were. It also lists who are the people who collected the dataset and how to cite the dataset properly. You can see an example of an introduction in Example 2.1

#### Example 2.1: A Codebook Introduction
 
<div style="text-align:center"><img src ="images/htad_lesson_02_image_07.png" style="max-width:60%;" /></div>

2)  Overview of the dataset

This tells you the file format of the dataset, the file name and the structure of the data: how many rows and columns.

#### Example 2.2: Overview of a dataset

**Dataset: ‘Singapore Sex Dataset’.**
File format: Excel 2010 file: .xlsx
File name: 2012, Harrigan, Dataset 5a, Attribute data as excel file.xlsx
Data structure: 
 * 1112 x 32 matrix + column headings
 * 1112 rows (participants)
 * 35 cols (variables)

3)  Descriptive statistics

This tells you variable name, variable number, minimum, maximum, mean, standard deviation of each variable.

#### Example 2.3: Descriptive statistics

<div style="text-align:center"><img src ="images/htad_lesson_02_image_08.png" style="max-width:60%;" /></div>

4)  Long descriptions of attribute variables

This section lists each variable in detail. It states the type of variable and the coding of the variable. THIS IS THE MOST IMPORTANT PART OF A CODEBOOK.

#### Example 2.4: Long descriptions of attribute values

<div style="text-align:center"><img src ="images/htad_lesson_02_image_09.png" style="max-width:60%;" /></div>

5)  Sources

This section lists where the data from the codebook is taken from (if any).

6)  References

This section lists the references (if any).

Once done with your codebook, you generally save your datasets like this: 

1)  [Your Dataset].xlsx (Coded data)

2)  [Your Dataset].docx (Codebook)

Note:

• That we have saved the ‘coded values’ not the ‘choice text’ version of the dataset. We used the ‘choice text’ version to make the codebook, but now that we have the codebook, the ‘choice text’ version is redundant.

• That we have saved the data as Excel files. This is needed to import into SPSS.

### STEP 3 – Importing into SPSS

1)  Open SPSS (if you don’t have this installed, go to IITS to get it installed).

2)  Close the first dialogue box that opens

3)  Go to File > Open > Data 

<div style="text-align:center"><img src ="images/htad_lesson_02_image_10.png" style="max-width:60%;" /></div>
 
4)  In the dialogue box that opens, change “Files of type” to “Excel”.

5)  Navigate to select your dataset.
 
<div style="text-align:center"><img src ="images/htad_lesson_02_image_11.png" style="max-width:60%;" /></div>