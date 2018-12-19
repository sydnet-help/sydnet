---
title: "Lesson 4: Tools for Data Analysis."
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_04.html
summary: "This week we are going to ..."
---

*Last updated: 20 Aug 2018*

Load dataset

    aes_full <- readRDS(gzcon(url("https://mqsociology.github.io/learn-r/soci832/aes_full.rds")))

Open codebook

    browseURL("https://mqsociology.github.io/learn-r/soci832/aes_full_codebook.html")

## OVERVIEW ----

Welcome to Week 4 of SOCI832: Advanced Research Methods. This week we are going to deal with four main topics: 
   (1) creating new variables
   (2) creating indexes
   (3) testing indexes with Cronbach Alpha
   (4) normalising variables
#
                          #
 //////////////////////////////////////////////////
 PART 1: CREATING NEW VARIABLES ----
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                          #
#
 There are many times when you will want to create new
 variables or you will want to recode an existing 
 variable. 
#
 We are going to look at three different ways to do the
 same thing: make a new age variable, with the
 following values:
 1 = 29 or younger
 2 = 30-59
 3 = 60 or older
#
 ......................................................
 * METHOD 1: COPY OLD VARIABLE & CHANGE VALUES ----
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 You can make a new copy of the variable by simply
 using code such as this:

aes_full$new_age <- aes_full$age 

 We then change the values using these commands:

aes_full$new_age[aes_full$age<30] <- 1 
aes_full$new_age[aes_full$age>29 & aes_full$age<60] <- 2 
aes_full$new_age[aes_full$age>59] <- 3 

 These commands have a similar form. 
 Each says:
 * "put the value on the right of the arrow" e.g.  "<- 1"
 * "into the variable on the left of the arrow" i.e. "elect_2013$new_age"
 * "for rows where the statement inside the square brackets is true" 
 e.g. "[elect_2013$age<30]"
#
 The statements inside the square brackets are statements that
 are true or false statements (called a logical statements,
 which are either TRUE or FALSE). 
#
 The main commands you will use when writing
 logical statements are called 'Logical Operators':
   ==         EQUAL
   <          LESS THAN
   >          GREATER THAN
   <=         LESS THAN OR EQUAL TO
   >=         GREATER THAN OR EQUAL TO
   !=         NOT EQUAL
   &          AND
   |          OR
   is.na()    IS MISSING

 ......................................................
 * METHOD 2: IFELSE() ----
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 The second main method is to use the ifelse() function.

 For making binary variables, this is quite easy. Let's say
 we want to create a new variable called 'female'. 
#
 In this dataset, gender is held in the variable named 'h1'.
 This can be seen in the codebook, which is extracted below:

 ID      Name  Label           Values  Value Labels
 253     h1      H1.Sex          -1        Missing
                           1       Male
                           2       Female

 Full codebook here:
browseURL("https://mqsociology.github.io/learn-r/soci832/aes_full_codebook.html")

 We create the new variable with the following commmand:

aes_full$female <- ifelse(aes_full$h1 == 2, 1, 0) 

 ifelse() has the structure:
 
 data_frame$variable_to_change <- ifelse(logical statement to evaluate,
                                       value to return if statement true,
                                       value to return if statement false)
#
 So the command above, say "if 'h1 == 2', then put '1' in the 'female'
 variable, otherwise put a '0' in the female variable." 
#
 For more complex changes, such as the one creating three variables
 for age, it is a little more complex. Below is the command to
 create such a variable:

aes_full$new_age2 <- ifelse(aes_full$age<30, 1,
                             ifelse(aes_full$age>29 & aes_full$age<60, 2,
                                    ifelse(aes_full$age>59, 3, 99999)))

 While this looks complex, it really just puts each additional
 option into the "if false" space in the previous function.

 ......................................................
 * METHOD 3: CAR PACKAGE: RECODE() FUNCTION ----
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 There are several different recode functions in R packages.
 You can see how to use the 'car' package, recode() function 
 below.
 
install.packages("car")
library(car)

aes_full$new_age3 <- aes_full$age
aes_full$new_age3 <- car::recode(aes_full$new_age3, 
                                   "1:29 = '1'; 30:59 = '2'; 
                                   60:140 = '3'")

 Note that I've used the command car::recode(...) to specify
 that the recode function we want to use is the one from the 
 package 'car' (rather than from any other packages you may
 have installed, such as 'Hmisc' and 'dplyr' packages).

 To read the help file on car::recode, run the following line
 of code:
?car::recode

                          #
 //////////////////////////////////////////////////
 PART 2: CREATING AN INDEX ----
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                          #
 Often you will have a series of variables which
 actually measure the same underlying concept. And
 when it happens, it is often a good idea to create
 one variable that is the sum of them all. When we
 do this, the combined variable is called an 'index'
 or a 'scale'. 
#
 In this section we will experiment with making
 two different indexes: 'economic conservative', 
 and 'pro-migration'.

 Creating an index is often simply a matter of 
 adding together the variables which you want to
 build the index out of. 
#
 In this case, we are making the index economic
 conservatism out of the following variables:

 aes_full$d8p8 - Spend less on welfare benefits (1-5 scale)
 aes_full$d8p5 - Spend less on old-age pensions (1-5 scale)
 aes_full$d8p3 - Spend less on unemployment benefits (1-5 scale)
 aes_full$d13p3 - Big business does NOT have too much power (1-5 scale)
 aes_full$d13p6 - Govt should NOT take measures to reduce differences in income  (1-5 scale)
 aes_full$d13p4 - Income and wealth should NOT be redistributed (1-5 scale)
 aes_full$d1health - Health and medicare is NOT important when deciding how to vote  (1-3 scale)

 So if we wanted to create this scale, we could simply
 add these seven variables together:

aes_full$econ_cons_index <- (aes_full$d8p8 + aes_full$d8p5 +
                               aes_full$d8p3 + aes_full$d13p3 + 
                               aes_full$d13p6 + aes_full$d13p4 +  
                               aes_full$d1health)

 There are, however, two things we should ask before adding
 the variables together in a scale:
#
   1. Do these variables all co-vary as a scale should? We test
      this with 'Cronbach Alpha'.
#
   2. Are these variables all measured on the same scale (e.g
      from 1 to 5), and if not, we should probably normalise them.

                          #
 //////////////////////////////////////////////////
 PART 3: TESTING INDEXES WITH CRONBATCH ALPHA ----
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                          #
 
 To test if the items in an index are all moving together
 we generally calculate the statistic called 
 Cronbach's alpha. 
#
 You can read more about Cronbach's Alpha and reliability
 analysis in Field et al. 2012, 'Discovering Statistics
 using R' section 17.8, pp.797-807.
#
 To run Cronbatch's Alpha we first install and load
 the 'psych' package

install.packages("psych")
library(psych)

 We then need to create a matrix or data frame to hold
 the variables we want to test (and no others).

test.matrix <- cbind(aes_full$d8p8, aes_full$d8p5, aes_full$d8p3, 
                     aes_full$d13p3, aes_full$d13p6, aes_full$d13p4,
                     aes_full$d1health)

 we then run the command for Cronbach's Alpha. I include
 the name of the package (psych) before the command because
 there is an alpha command in some other packages, and this
 will make sure the right 'alpha' runs, no matter what else
 you have loaded in R.
psych::alpha(test.matrix)

 The output you get will look like this:
    
       Reliability analysis   
     Call: psych::alpha(x = test.matrix)
     
     raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
     0.72       0.7    0.73      0.25 2.4 0.0066  2.4 0.59     0.19
     
     lower alpha upper     95% confidence boundaries
     0.7 0.72 0.73 
     
     Reliability if an item is dropped:
       raw_alpha std.alpha G6(smc) average_r S/N alpha se var.r med.r
     V1      0.66      0.64    0.64      0.23 1.8   0.0079 0.020  0.17
     V2      0.71      0.69    0.72      0.27 2.2   0.0069 0.033  0.24
     V3      0.67      0.66    0.66      0.24 1.9   0.0076 0.020  0.17
     V4      0.70      0.69    0.72      0.27 2.2   0.0070 0.030  0.24
     V5      0.66      0.65    0.66      0.23 1.8   0.0082 0.025  0.17
     V6      0.65      0.64    0.65      0.23 1.8   0.0082 0.024  0.17
     V7      0.72      0.71    0.74      0.29 2.5   0.0068 0.030  0.27
     
     Item statistics 
     n raw.r std.r r.cor r.drop mean   sd
     V1 3818  0.70  0.69  0.67   0.52  3.0 1.02
     V2 3836  0.51  0.54  0.39   0.32  2.1 0.83
     V3 3790  0.65  0.64  0.60   0.47  3.1 0.96
     V4 3808  0.54  0.53  0.39   0.34  2.2 0.92
     V5 3815  0.71  0.67  0.62   0.53  2.6 1.12
     V6 3814  0.72  0.68  0.64   0.54  2.6 1.09
     V7 3836  0.36  0.45  0.27   0.23  1.3 0.55
     
     Non missing response frequency for each item
     1    2    3    4    5 miss
     [1,] 0.08 0.21 0.45 0.18 0.09 0.03
     [2,] 0.24 0.44 0.29 0.02 0.01 0.03
     [3,] 0.05 0.16 0.50 0.20 0.09 0.04
     [4,] 0.25 0.42 0.25 0.07 0.01 0.04
     [5,] 0.16 0.34 0.26 0.18 0.06 0.04
     [6,] 0.16 0.34 0.28 0.17 0.05 0.04
     [7,] 0.70 0.26 0.04 0.00 0.00 0.03

 The key number to read is on the fourth line, and is under
 words 'raw_alpha'.
#
 This is the Cronbach Alpha, and should be as high
 as possible, but at least above 0.6 or 0.7 (depending on
 which reference you use).
#
 The second thing you do when reading this out put is look
 at first column (raw_alpha) under "Reliability if an item is dropped"
 
 This number is quite an intuitive number. It is the 
 value of Cronbach Alpha IF this variable is dropped from the 
 index. The point of this is that IF the Cronbach Alpha
 goes up after dropping a variable, the index is probably
 better without this variable in it. 
#
 So in this case, we look at this column and see if the 
 raw_alpha goes above 0.72 (the current alpha) if 
 any of the variables are dropped. It doesn't, so 
 we will leave all the items in our scale. 
#
 ...................................................................
 EXAMPLE OF A REVERSE CODED VARIABLE/VARIABLE NEEDING TO BE DROPPED
 ```````````````````````````````````````````````````````````````````
 In this next example I've included a extra variables, so
 as to illustrate what happens when we have variables
 which don't make a good scale.
#
 The variable is 
#
 aes_full$e6boats -  Boats carrying asylum seekers should NOT 
                     be turned back

test.matrix <- cbind(aes_full$d8p8, aes_full$d8p5, aes_full$d8p3, 
                     aes_full$d13p3, aes_full$d13p6, aes_full$d13p4,
                     aes_full$d1health, aes_full$e6boats)

psych::alpha(test.matrix)

 When you run this command, you will get a red error message
 at the end of the results which says:
#
       Warning message:
       In psych::alpha(test.matrix) :
         Some items were negatively correlated with the total scale and probably 
       should be reversed.  
       To do this, run the function again with the 'check.keys=TRUE' option

 We got this error because one of the variables was not only 
 bad for the scale, but actually moving in the OPPOSITE direction.
#
 Many of this times this happens, it is because the researcher
 has forgotten that one of the items in their survey is actually
 reverse coded - for example if we had a question in our survey
 that was "Should the govt tax the rich", with 1 being Strongly
 disagree, and 5 being strongly agree, this would produce a similar
 error, because all the rest of our questions are measuring
 economic conservatism.
#
 However, in this case, the error is because of our eighth variable
 - which is those who disagree with 'turning back the boats' of
 refugees.
#
 How do we know this? 
#
 There are two places you can see it:
   1. Under 'reliability if item is dropped', then Alpha increases 
   significantly - to 0.72 - if variable 8 is dropped.
#
   2. Under 'item statistics, and the measure 'r.cor' - which 
   is the correlation of the item with the entire scale - the
   correlation of variable 8 is negative (-0.079), showing that
   it is moving in the opposite direction to the other items.

                          #
 //////////////////////////////////////////////////
 PART 4: NORMALIZING VARIABLES ----
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                          #
#
 There is one other issue that comes up quite often when making
 indexes and scales: not all the variables are measured in
 the same units. 
#
 The way this is generally resolved is by centring
 and normalising all the variables. 
#
 This is done by subtracting the mean from the 
 value of the variable for each unit of analysis
 and then dividing that value by the standard 
 deviation of the variable. 
 
 The effect of this is to make the mean equal
 to zero, and the standard deviation equal to one.
#
 If we do this for all variables before adding
 them together to make an index, then they 
 will all be in the same units and they will 
 all have similar impact on the final index.
#
 To simplify the process of normalizing varibles
 I have created a function called 'norm'. To load
 this function, you need to run the entire next
 five lines of code at once (highlight them all
 with your mouse and then hit Control+Enter )

norm <- function(x) {
  y <- (x - mean(x, na.rm = TRUE))/
    sd(x, na.rm = TRUE)
  return(y)
}

 In the case of our economic conservative index
 we have the problem that the last variable in the index
 - 'Health is not important when voting' - is on a 1 to 3
 scale, rather than 1 to 5 scale like the others. 
#
 To address this,I'm going to create normalised variables
 for all the items in this index as follows. 
 Note that I am creating new variables that start with n_

aes_full$n_d8p8 <- norm(aes_full$d8p8)
aes_full$n_d8p5 <- norm(aes_full$d8p5)
aes_full$n_d8p3  <- norm(aes_full$d8p3)
aes_full$n_d13p3 <- norm(aes_full$d13p3)
aes_full$n_d13p6 <- norm(aes_full$d13p6)
aes_full$n_d13p4 <- norm(aes_full$d13p4)
aes_full$n_d1health <- norm(aes_full$d1health)

 After creating the normalised variables, its often good
 to just check the Cronbach Alpha again, to make sure
 you haven't screwed up the code of any of your variables

test.matrix <- cbind(aes_full$n_d8p8, aes_full$n_d8p5, 
    aes_full$n_d8p3, aes_full$n_d13p3, 
    aes_full$n_d13p6, aes_full$n_d13p4,
    aes_full$n_d1health)

psych::alpha(test.matrix)

 Honestly, when you run this, you will see that our health
 variable isn't great - the cronbach alpha slighly improves when 
 we remove it (from 0.70 to 0.71), but for the purposes
 of this example, we will just leave it in.

aes_full$econ_cons_index <- (aes_full$n_d8p8 + aes_full$n_d8p5 + 
                               aes_full$n_d8p3 + aes_full$n_d13p3 + 
                               aes_full$n_d13p6 + aes_full$n_d13p4 + 
                               aes_full$n_d1health)
 ...................................................................
 EXAMPLE OF PRO-IMMIGRATION INDEX
 ```````````````````````````````````````````````````````````````````
#
 Next we are going to make a pro-immigration index, using the following
 variables:
#
 Full codebook can be found here:
 https://mqsociology.github.io/learn-r/soci832/aes_full_codebook.html
 and, questionairre with exact questions here:
 http://legacy.ada.edu.au/ADAData/questionnaires/ADA.QUESTIONNAIRE.01259.pdf
 
 aes_full$e4 - Process and resettle onshore in Australia
 aes_full$e6boats - Do NOT turn back the boats
 aes_full$e2immig - Number migrants to Australian NOT gone too far
 aes_full$e2migeo - Equal opportunity for migrants NOT gone too far
 aes_full$e6ethnic - People do NOT think of themselves as ethnic groups, rather than individuals
 aes_full$e2asia - Close links to Asia NOT gone too far
 aes_full$f8p1 - Immigrants do NOT increase crime
 aes_full$f8p3 - Immigrants do NOT take jobs from Australians

 We need to recode e4, because option 4 is 'don't know', so we use this
 code:

aes_full$recode_e4 <- car::recode(aes_full$e4, 
                                  "1 = '1'; 2 = '2'; 
                                  3 = '3'; 4 = NA")

 we can test the Cronbach Alpha:

test.matrix <- cbind(aes_full$e6boats, aes_full$e2immig, aes_full$e2migeo, aes_full$e6ethnic,aes_full$e2asia, aes_full$recode_e4, aes_full$f8p1, aes_full$f8p3)    
psych::alpha(test.matrix)

 We can see that the Cronbach Alpha is very high - 0.85, and it 
 doesn't really get very much larger by dropping any items - we could
 drop item 4 if we wante - but you cant see it still correlates with
 the overall index at around 0.37, which is quite high. 

 Because some of the items are measured on different scales,
 we will normalise all the variables before adding them:

aes_full$n_recode_e4 <- norm(aes_full$recode_e4)
aes_full$n_e6boats <- norm(aes_full$e6boats)
aes_full$n_e2immig <- norm(aes_full$e2immig)
aes_full$n_e2migeo <- norm(aes_full$e2migeo)
aes_full$n_e6ethnic <- norm(aes_full$e6ethnic)
aes_full$n_e2asia <- norm(aes_full$e2asia)
aes_full$n_f8p1 <- norm(aes_full$f8p1)
aes_full$n_f8p3 <- norm(aes_full$f8p3)

 Testing with Cronbach Alpha just to make sure everything is still working:
test.matrix <- cbind(aes_full$n_e6boats, aes_full$n_e2immig, aes_full$n_e2migeo, aes_full$n_e6ethnic, aes_full$n_e2asia, aes_full$n_recode_e4, aes_full$n_f8p1, aes_full$n_f8p3)    
psych::alpha(test.matrix)

 Making our index:
aes_full$pro_immigrant <- (aes_full$n_e6boats + aes_full$n_e2immig + aes_full$n_e2migeo + aes_full$n_e6ethnic + aes_full$n_e2asia + aes_full$n_recode_e4 + aes_full$n_f8p1 + aes_full$n_f8p3)    


 ...................................................................
 EXAMPLE OF USING INDEXES IN REGRESSION MODELS
 ```````````````````````````````````````````````````````````````````
 Let's now look at how we can use these indexes
 in a regression model.
 
 To make this easier to read, I'm going to create various 
 independent variables that are a little easier to read and 
 understand. You can look them up in the codebook or questionairre
 if you want to understand them better:
aes_full$union_memb <- ifelse(aes_full$g6 == 1, 1, 0)
aes_full$aust_born <- ifelse(aes_full$h23own == 1, 1, 0) 
aes_full$female <- ifelse(aes_full$h1 == 2, 1, 0) 
aes_full$income_10kunits <- aes_full$h15
aes_full$income_security <- aes_full$d11
aes_full$own_a_home <- ifelse(aes_full$h4p1 == 1, 1, 0) 
aes_full$own_a_business <- ifelse(aes_full$h4p2 == 1, 1, 0) 
aes_full$own_any_stocks <- ifelse(aes_full$h4p3 == 1, 1, 0) 
aes_full$own_any_savings <- ifelse(aes_full$h4p4 == 1, 1, 0) 
aes_full$years_tertiary_study <- aes_full$g2

 MODEL OF ECONOMIC CONSERVATISM:
 Now let's make a model of economic conservatism:
model.1 <- lm(aes_full$econ_cons_index ~ aes_full$age + aes_full$female + aes_full$aust_born + aes_full$income_10kunits  + aes_full$income_security + aes_full$union_memb + aes_full$own_a_home + aes_full$own_a_business + aes_full$own_any_stocks + aes_full$own_any_savings  + aes_full$years_tertiary_study)
summary(model.1)

 Let's add the standardised beta's so we can get a better idea
 about the relative importance of various predictors:
install.packages("lm.beta")
library(lm.beta)
summary(lm.beta(model.1))

 MODEL OF PRO-MIGRATION VIEWS:
model.2 <- lm(aes_full$pro_immigrant ~ aes_full$age + aes_full$female + aes_full$aust_born + aes_full$income_10kunits  + aes_full$income_security + aes_full$union_memb  + aes_full$own_a_home + aes_full$own_a_business + aes_full$own_any_stocks + aes_full$own_any_savings + aes_full$years_tertiary_study)
summary(model.2)
summary(lm.beta(model.2))


 This is the end of the Week 4 
 R code/ R-script file.
