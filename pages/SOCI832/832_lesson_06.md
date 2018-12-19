---
title: "Lesson 6: Writing A Paper."
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_06.html
summary: "This week we are going to ..."
---

*Last updated: 4 Sept 2018*

                          #
 TITLE: 6. Writing A Paper
 SOCI832: Advanced Research Methods
 Week 6: Writing A Paper (1 of 1 file)
 Author: Nicholas Harrigan
 Last updated: 4 Sept 2018
                          #

                         #
 //////////////////////////////////////////////////
 OVERVIEW ----
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                          #

Welcome to Week 6 of SOCI832: Advanced 
 Research Methods. 
 
 This week we will focus giving you
 guidance for presenting statistical models and 
 as both (1) a presentation; and (2) a short written
 paper (~2,000 words). In the text written here, 
 I will dissect the slides and paper to see the 
 unwritten rules that lie behind a standard
 quantitative academic paper.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 1 Overview of structure ----
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 - - - - - - - - - - - - - - - - - - - - - - - -
 |   Section     |   Paper    |   Presentation |
 |               |   (words)  |     (slides)   |
 - - - - - - - - - - - - - - - - - - - - - - - -
 |   Title       |    ~20     |        -       |
 |               |            |                |
 |   Abstract    |    ~200    |        -       |
 |               |            |                |
 |   Intro +     |            |                |
 |   Background +|    ~600    |       ~3       |
 |   Lit Review  |            |                |
 |               |            |                |
 |   Methods     |    ~400    |       ~3       |
 |               |            |                |
 |   Results     |    ~300    |       ~3       |
 |               |            |                |
 |   Discussion  |    ~600    |       ~3       |
 |               |            |                |
 |   Bibliography|    1-10    |        1       |
 |               |    items   |                |
 |               |            |                |
 |   Attachment 1|   no fixed |       ~3       |
 |   : R-code    |   length   |                |
 |   with your   |            |                |
 |   comments    |            |                |
 |   explaining  |            |                |
 |   what you    |            |                |
 |   have done,  |            |                |
 |   briefly     |            |                |
 |               |            |                |
 |   Attachment 2|   email    |        -       |
 |   : your data |   or       |                |
 |   and codebook|   upload   |                |
 |   - can be    |   to ilearn|                |
 |   from        |            |                |
 |   original    |            |                |
 |   source.     |            |                |
 |               |            |                |
 - - - - - - - - - - - - - - - - - - - - - - - -
 |               |            |                |
 |     NOTE: Reader/Marker should be able to   |
 |     reproduce your results with the R-code  |
 |     and dataset provided in Attachments 1+2 |
 |               |            |                |
 - - - - - - - - - - - - - - - - - - - - - - - -
#

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 2 General Advice ----
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 When writing-up an academic paper, what is most 
 important is to be aware of the most common pitfalls
 (mistakes), and rabbit-holes (time wasters) that
 junior scholars tend to make. I'll try to list the
 major problems, and then some general antitodes.
 Remember at this stage it is much more ART than
 SCIENCE, and so the rules are not absolute, but
 rather very rough guidelines.

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 2.1 Pitfalls (mistakes) and rabbit-holes (time wasters) ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 REMEMBER, THESE ARE THINGS *NOT* TO DO.

STYLE/PRESENTATION:
 1. Making your argument too complex.
 2. Making an argument about a minor point
 3. Not making an argument
 4. Not explaining why
 5. Believing you have no need to inspire and 
   motivate the reader or communicate clearly
 6. Over-explaining
 7. Adopting too casual (informal or coloquial)
   tone

LITERATURE REVIEW
 8. Not speaking to existing academic or policy debate or
   a common/widespread myth.
 9. Not defining the key terms in your research question,
   theory, and hypothesis (e.g. what is 'status'?)
   literature. 

METHODS + DATA
 9. Not explaining simply and systematically the data
   source and methods of analysis (remember the rule is:
   could someone use the information you provide to 
   replicate the study - if not, you need more detail)

ANALYSIS
 10. Not controlling for competing explanations in models
 11. Miscoding data or code:
     a. analysing missing values (like 9999 or 999 or 99 
     or 9) as data points; 
     b. analysing categorical variables as continous 
     (e.g. race); 
     c. getting the dependent variable and independent 
     variable backwards in your models;
     d. making an error early in your code which flows
     through to the rest of the modelling;
     e. not changing variables which are actually reverse
     coded (e.g. Strongly agree is actually strongly
     disagree, or e.g. You think 1 = "dead" and 0 = "alive",
     but actually 1 = "alive"and 0 = "dead"
 12. Your measures (variables) don't measure the concepts
   in your research question/theory/hypothesis.
 13. Not presenting descriptive, bivariate, and multivariate
   tables of your data
 14. Tables not being self-contained (they need to be
   able to be read alone)
 15. Tables not being referred to in text (they need to be
   referred to in the text)
 
 DISCUSSION
 16. Not relating your findings to your literature
 17. Not focusing on the key findings, the key argument
   and the main findings
 18. Being either too confident or too hesitant to draw
   conclusions from your study. 

REMEMBER, THESE ARE THINGS ^^^ *NOT* TO DO.
#
#

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 2.2 Strategies for success ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 These are some rules of thumb for success. 
 
 Most are antidotes to the problems listed above.

STYLE/PRESENTATION:
 1. Keep It Simple Stupid (KISS):
    * One point for the whole paper
    * One point per paragraph
    * Write in short sentences
    * Don't use big words or jargon (if you can avoid them)
    * For your key concepts (e.g. 'sexist attitudes'), define
    at the beginning, and then continually use the same
    word or phrase to refer to them (e.g. don't call 
    'sexist attitudes' different terms like 'patrichal beliefs'
    'anti-woman statements' etc. It is confusing for the reader.)
 2. Remember you get to make one argument for the 
   whole paper.
 3. The argument needs to fit in a single sentence
 4. Start paper with the motivation: Why should the reader care?
   Remember motivation tends to come from (1) 'facts' that everyone
   can agree have widespread or important impact (e.g. lots of
   people died or were made sick by a disease; sexism has
   large impacts on women's incomes, health, sexuality, etc), 
   and (2) a problem with existing knowledge that is perhaps
   false, and so this paper can test their truth
   (e.g. but the most common theory/explanation for a 
   disease, or for sexism, doesn't explain some obvious facts and
   you have got a better idea which is reasonable to test).
 5. And come back to this motivation at the end,
   explaining how your work has help get us a tiny bit closer.
 6. Slay Giants, not Smurfs: When picking a topic try to 
   disprove/show problems with big ideas, common myths, 
   famous writers, important theories.
 7. Write with a relaxed, direct, easy tone. Like you are
   explaining something as a teacher or to a friend who is
   educated but not an expert in the area. 

LITERATURE REVIEW
 8. Make sure you cite important academic or policy papers
   which you are arguing or engaging with.
 9. Define your key concepts. A reference to an existing
   definition helps to do this quickly, simply, and in a 
   credible way.
 10. When reviewing the literature NEVER SUMMARISE PAPERS.
   Literature reviews are THEMATIC - they explain the major
   approaches to answering a question. There generally should
   be 2-4 themes, and they each deserve about a paragraph.
   Themes tend to be a set of major (1) causes; (2) effects;
   (3) complex theories; (4) mechanisms/mediators; or
   (5) some other set of explanations for a phenomena
   of interest.

METHODS + DATA
 9. Keep this short, simple, and with enough detail for 
   someone to replicate your study
 10. It is almost always best to look for a model paper
   from the place (e.g. journal) you are publishing in
   and copy the style (e.g. one sentence on location
   of data collection; one sentence on recruiting respondents;
   one sentence on response rate; one sentence on missing data;
   etc.)

ANALYSIS/RESULTS
 10. Remember to control for key demographic variables,
   if you have them (e.g. age, gender, SES, 
   ethnicity/nationality, education, etc.)
 11. Remember to control for alternative explanations, if
   you can. When trying to decide what is a reasonable 
   explanation:
     a. look at what variables you have in your data
     b. look at what the literature (the giants you are
     trying to slay) says are the explanations and see
     if you can control for this. 
     c. think about the person in a pub, and also about
     a 'devils advocate' - what would they say to try to 
     disprove your argument (e.g. they would say "But 
     maybe it is just x, and you didn't measure that!")
 12. To avoid miscoding data and code:
     a. When testing your code, run it line by line, look
     for error messages
     b. Check your the commands ran correctly by viewing 
     your data frame - does the data 'look' right?
     c. Check your data by using the commands summary(), 
     mean(), and hist() to inspect your variables, particularly
     any variables that you have transformed/modified. 
     d. Review this checklist:
        i. Are your missing values correct (they should
        be light grey, italicised 'NA' in the R Studio viewer)?
        ii. Are your binary variables coded "0" and "1"?
        iii. Are you categorical variables dummied out or
        do you put them in your analysis inside the function
        as.factor()? 
        iv. Are all your variables coded in the direction
        which you are assuming? Do you need to reverse code
        any of them? Check with looking at how they correlate
        with variables you are confident in, and which you
        know have a particular (e.g. positive) correlation
        with the variable you are checking.
 13. Operationalisation: Look at your key variables with a 
   skeptical eye: do they really measure the concept you say 
   they do? Would an impartial observer agree? 
 14. Modelling: Look at your final model (normally a 
   regression), and then compare it to you research question 
   and hypothesis. Ask yourself honestly: does my model answer
   my research question? And test my hypotheses? Often we 
   need to change our question slightly to make it more 
   clearly express the type of analysis we are doing, and the
   limited data we actually have. Remember our question is 
   almost always about the relationship between two (or three)
   variables. 
 15. Tables should be self-contained - meaning the labels
   on axes, the notes at the bottom, the title, and other
   written and visual cues should make the table readable
   without needing to refer to the text.
 16. Tables should always be referred to in the text at least
   once. E.g. "As can be seen in Table 1, the mean age of 
   our respondents is 30.2 years of age."
 
 DISCUSSION
 16. The discussion needs to start (first paragraph) and 
   end (last paragraph) with a restatement of the WHY 
   - the motivation for the paper- and then the LOGIC
   of the paper - how the data analysis was supposed to help
   us to acheive our goals/motivations. 
 17. The discussion needs to focus on what the results
   tell us about THE LARGER QUESTIONS - whether it is 
   theory, or some policy question, or a common myth. It
   is not, per se, about the dataset/sample, or even the
   population being studied (unless that is relevant). 
 18. The discussion should include a limitations which
   neither to confident or too obsequious and hesitate. You
   have done important work analysing your data, and it almost
   definitely says something, so don't be overly skeptical 
   and hesitant.  At the same time, don't be over-confident.
   Ask what a reasonable, unbiased observer would say after
   looking at your data. 

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 3 Sections of a Paper ----
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.1 Title ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 CRITERIA: Criteria for judging a good title:
 1. Clear and straight-forward
 2. Expresses the core question, theory, or relationship
 of the paper.
 3. Includes keywords academics (or others) would search
 for to find your paper.
 4. Interesting and draws the reader towards wanting to
 read the paper.
 
 FORMULA: A simple formula for a title:
 1. Have two parts to the title - before and after the
 colon (:). 
 2. Part of title before colon expresses the puzzle, question,
 or findings in everyday language that a lay
 person would understand. For example: "Why are poor people
 rude?"
 3. The second part of the title (after the colon) then 
 expresses the puzzle, question, or findings in clear precise
 academic language, with keywords that are likely to be
 searched for by those would would want to read it. E.g. 
 "The impact of economic stress on mood in low income
 populations."
 
 PROCESS: The process for coming up with a title is basically one
 of brainstorming, polishing, experimenting, and research. 
 I tend to open a word document, type out any ideas that
 are on my head. I then type out keywords from my paper:
 variables, theories, concepts, methods. And then I will
 start writing out lists of concrete examples of each of
 these abstract concepts (e.g. low income -> poor people).
 I will also Google a thesaurus and look through alternative
 ways of expressing each of my key words. I will also
 look at articles that I am referencing and look at what
 keywords they have listed or used in their title or 
 abstract. After this it is simply a matter of experimentation
 and writing out examples, then going through and choosing
 the best few titles, and then repeating the experimentation
 process until you come up with a nice expressive title.
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.2 Abstract ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 A good abstract tells you the topic, research question,
 method and findings.

Note that the abstract is supposed to stand alone: it is
 to be read by many people who will never read the paper.
 It is best understood as a very very short version of 
 the entire article.  It is a summary of the article, 
 but you don't include phrases like "In this article.". 
 You simply state what the topic was, how it was researched
 and what was found.

Often a good abstract is simply four or five sentences
 each of which answers one these five questions, on order:
     1. What is the research question or puzzle?
     2. Why is this topic important/why should people care?
     3. What method and data did you use to answer the question?
     4. What did you find, expressed as one (or two) 
     statistical relationships between two (or more) variables? 
     5. (Optional) What are the implications of this for the
     world, academic theories, policy, or a key audience.
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.3 Intro + Background + Lit Review ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 In most papers this section is just called the 
 'Introduction' and includes both background, and
 the literature review. 
 
 I distinguish between three key parts of this 
 section of the paper by dividing it into three:
 (1) the introduction; (2) background/setting; and 
 (3) the literature review. 

The length of these will depend heavily on the
 word limit for your paper - all three sections
 can be long (each could be a chapter in themselves)
 or a paragraph. 

INTRODUCTION: The introduction is the first thing the
 reader reads. You should assume that the reader is 
 person who has a university degree (bachelor) but from
 a different discipline (e.g. an Engineering or History
 graduate). So they are literate and comfortable with reading
 but they lack familiarity with the jargon of your 
 discipline. 

Remember that the introduction needs to be written
 as though the reader has NOT read the abstract - 
 the abstract needs to stand alone without the paper, 
 and the paper needs to stand alone without the abstract. 
 
 So when you write the introduction, you are talking
 the generic reader, and orienting them to your paper. 
 Before they read the introduction, they know nothing, and
 by the end of the introduction they have a rough 
 outline of where they are going in the paper and why this
 paper and research is important.

My formula for an introduction that is one or two
 paragraphs long is this:
    1. What is the puzzle and/or research question which 
       motivates this study?
    2. Why is this topic important?  Why should anyone care?
    3. What are the main theories and/or hypotheses and/or
       questions to be evaluated in this study? (briefly)
    4. What method will you used to test between these
       theories/answer this question?
    5. What is the structure of the rest of this paper?

LITERATURE REVIEW: This section you review the relevant
 theoretical or policy or popular literature. 
 
 The key thing here is to do this review thematically,
 pointing to the key theories/explanations/myths/policy
 perspectives which you are testing between and/or
 evaluating. 
 
 The normal way to do this is to have a paragraph for
 each of 2-4 themes/theories. 
 
 For example, for the paper "Why are poor people rude?",
 you might have four competing explanations: 
   1. Culture: One approach explains poor people's rudeness
      as being caused by their lack of sophisticated culture
      and education.
   2. Economic stress: Another approach explains rudeness
      as caused by economic stress. 
   3. Myth: Another part of the literature says the 
      relationship between SES and rudeness does not exist.
   4. Polite poor: Another part of the literature says
      that actually lower SES individuals tend to be more
      polite, particularly with respect to ethical rules
      because they have a greater sense of empathy created
      through experience of disadvantage, and a lower sense
      social status (and hence less entitlement).

BACKGROUND: This is an optional section. It exists to 
 introduce the reader to specific technical, geographic, or
 social information which is needed to properly understand
 the dataset and/or population and/or policy problem being
 studied. For example, in my research I study migrant 
 workers in Singapore, and often I need to include a 
 'Background' section in the paper to explain basic information
 like: how many migrant workers are in Singapore, countries
 of origin, visa arrangements, pay and industry, commonly
 reported problems and issues. 
 
 Note that this section is different to the data section
 in 'Methods and Data', because the data section is about
 your specific sample. Background tends to be about the 
 general population or topic you are studying.

The background section can be thought of as a bit
 of a catch all section for all the miscellanious 
 information which you need to give to orient the
 reader, but which doesn't fit in a short introduction
 or in the theory section.

This section is sometimes called "Setting".

The Background/Setting can go before or after the 
 literature review, depending on what works best 
 stylistically.
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.4 Methods + Data ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 There are many ways to divide up a methods section, and
 if you would like to see detailed breakdowns of how complex
 it can get, take a look at Appendix One of the 
 'Publication Manual of the American Psychological Association'. 
 This contains "Journal Article Reporting Standards" which 
 specify what to include in every section of a psychology
 paper.

However, I recommend a simpler system. I suggest a
 four part division of this section into: 
 (1) Hypotheses; (2) Data; (3) Instruments; and 
 (4) Statistics. 

HYPOTHESES: State your key hypotheses. Rules for
 hypotheses: 
   1. Remember that you should only have a few 
      (maybe 1 to 4) hypotheses.
   2. Hypotheses start with "That ..."
   3. Hypotheses normally express a relationship between two
      (or more) variables. For example "That those with greater 
      economic stress will report lower tolerence for
      violation of social norms, after controling for 
      education."
   4. Relationships between two variables have only
      three fundamental patterns: (1) POSITIVE: the more 
      A, the more B; (2) NEGATIVE: the more A, the less B;
      or (3) NO RELATIONSHIP: A and B are independent.
   5. Hypotheses are best stated at the conceptual level.  
      e.g. 'economic stress', not "our economic stress scale".
   6. Hypotheses should test a relationship which will
      falsify one or more theories, and ideally test
      or distinguish between the effects of two or more
      theories. So our hypothesis says that economic stress
      operates on tolerance (rudeness), even after controlling 
      for the lower education of those under economic stress.

DATA: Describe the source of your data. How it was 
 originally collected, when, where. The sample size. 
 The response rate. And then any cleaning or changes
 you made to the data (such as excluding cases that
 were not relevant to your study). If you collected
 your own data, then report the ethical approval 
 (institutional review board in the US system) which 
 you (hopefully) received. 

INSTRUMENTS: Describe how you operationalised (i.e
 how you measured) all your key variables. Summarise
 this. You can give examples of questions in large
 indexes/scales constructed from many questions, or
 you can put these in a table, and refer to it in the 
 text.

STATISTICS: Describe the statistical analysis you undertook.
 The key things here are to explain WHAT method you used,
 and WHY you chose this method. If you chose to include
 particular variables in some models and not others, 
 explain your rationale for including/excluding variables.
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.5 Results ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 These should focus on simply reporting the results
 of your research, and preliminary analysis.

This section should be short.

I would generally recommend reporting three tables:
 (1) descriptive statistics; (2) correlation matrix
 of key variables; and (3) regression models. 

Methods for extracting and presenting these tables are in 
 the Week 5 notes. 
 
 For the text of the Results, the main problem people
 have is (1) they make it too long; and (2) they go
 beyond REPORTING and start DISCUSSING. 

Remember that the Results are NOT the section to discuss
 the implications for your theories, for the real world,
 or to compare and contrast with existing literature. 

Focus on keeping this section simple, boring, and short. 
 One or two sentences per model is appropriate. Focus on
 the highlights. Remember your paper only has one argument,
 and can only make one point, so there are that many
 statistics that are important to report here. Focus
 on those that tell the main story.

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.6 Discussion ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 This should focus on understanding and interpreting 
 your results.
 
#	The aim of this section is to systematically attempt to:
#	* Understand your results and their implication for your 
 hypothesis, and thus your theory/policy debate/myth.
#	* Consider the congruence and contradictions between your 
 results and the existing literature.
 
 It will include a limitations section, which should
 thread a fine line between healthy skepticism, and 
 robust defense of the results of your research project.
 Many students tend to veer either into being overly
 skeptical about their results, or overly confident
 in their results. You need to realistically assess
 the quality of your data, your methods, and your
 results. You can recommend future research, but 
 remember to be realistic about this - it's true
 that someone could spend millions of dollars doing
 a large scale randomised control trial on the topic
 of your paper, but people are probably more interested
 in what sorts of research would likely move forward
 the frontier of human knowledge a little, and also
 could be done with limited resources of ordinary
 researchers - like a Masters or PhD student thesis. 
 
 Remember to start (first paragraph) and 
 end (last paragraph) with a restatement of the WHY 
 - the motivation for the paper- and then the LOGIC
 of the paper - how the data analysis was supposed to help
 us to acheive our goals/motivations - and then RESULTS 
 of the paper - what it appears to tell us. 

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.7 Bibliography ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 Please include a simple bibiolography in a standard
 academic format. I would suggest American Psychological
 Association (APA) format.

You don't need a lot of references. I would expect and
 be happy with one to five references.

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.8 Attachment 1: R-script ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 Please include the R-script used for your analysis. 
 
 Please include very brief comments (after a  symbol) 
 before most commands explaining what you are doing and
 why.

- - - - - - - - - - - - - - - - - - - - - - - - - - 
 * 3.9 Attachment 2: Dataset ----
 - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 Please email me a copy of your dataset and the codebook,
 if the dataset is not one provided for the class on iLearn.
