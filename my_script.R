install.packages("blogdown")
install.packages("devtools")
install.packages("rmarkdown")

# run the install.packages first, and then run the second lot of code below

library(blogdown)
library(devtools)
library(rmarkdown)
# blogdown::install_hugo()
# blogdown::install_theme(theme = "gcushen/hugo-academic")

setwd("c:/users/nickh/methods101/")
blogdown::serve_site()
browseURL("http://127.0.0.1:4321/docs/")

?datasets

x<-1
age <- c(36, 19, 30, 55, 42)
gender <- c("male", "female", "female", "male", "female")
ds <- cbind(age, gender)
ds <- as.data.frame(data)

length(x)
str(x)
class(x)
names(x)

length(age)
str(age)
class(age)
names(age)

length(gender)
str(gender)
class(gender)
names(gender)

length(ds)
str(ds)
class(ds)
names(ds)




