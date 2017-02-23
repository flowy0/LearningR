#####R Code 

##Tutorial from computerworld.com
#http://www.computerworld.com/article/2598083/app-development-beginner-s-guide-to-r-easy-ways-to-do-basic-data-analysis.html?page=4

?functionName
help(functionName)
example(functionName)
args(functionName)

mydata <- read.csv("filename.txt", header=FALSE)
mydata <- read.table("filename.txt", sep="\t", header=TRUE)

#If you don't want your text data to be read in as factors, add #stringsAsFactor=FALSE to read.table, like this:
mydata <- read.table("filename.txt", sep="\t", header=TRUE, stringsAsFactor=FALSE)

#Copy data from clipboard in table form
x <- read.table(pipe("pbpaste"), sep="\t")

#Copy data from web links
mydata <- read.csv("http://bit.ly/10ER84j")

#External data from a package
#All you need are four short lines of code to install the Quantmod #package, load it, retrieve a company's stock prices and then #chart them using the barChart function. Type in and run the #following in your R editor window or console for Apple data:

install.packages('quantmod')
library('quantmod')
getSymbols("AAPL")
barChart(AAPL)

barChart(AAPL, subset='last 14 days')
chartSeries(AAPL, subset='last 14 days')

barChart(AAPL['2013-04-01::2013-04-12'])

##Reading Data 
head(mydata)
head(mydata, n=10)
#or 
head(mydata, 10)

#last few rows
tail(mydata)

#structure
str(mydata)

#look for col and row names
colnames(mydata)
rownames(mydata)

#summary stats
summary(mydata)

#more summary stats
#Mean Abs Dev, skew, kurtosis
install.packages("psych")
library(psych)
describe(mydata)

#correlation on a data frame
#returns a matrix 
cor(mydata)

mean(vector, na.rm=TRUE)

#create combinations of a group
mypeople <- c("Bob", "Joanne", "Sally", "Tim", "Neal")
test1 <- combn(mypeople,2)

##############   Subsetting Data      ##############   

#get names of variables from data frame
names(mtcars)
#store names 
mtcars.colnames <- names(mtcars)

#get data in one column
mtcars$mpg
#or choose by col ID
mtcars[rows, cols]
#cols and rows can be selected in many ways
rows<- 1:6
cols <- 1:3
cols2 <- c(1,3,7)
#in one line - all rows, and col 2 and 4
mtcars[,c(2,4)]

mtcars[,-1] 
#will not get you the last column of a data frame, 
#Instead, negative indexing in R means exclude that item. 
#So, mtcars[,-1] will return every column except the first one.

#using conditions - like filtering
mtcars$mpg>20 
#this is a logical test, results show true or false for each value

#to generate a list, use 
mtcars[mtcars$mpg>20, c(1,4)]
mtcars[mtcars$mpg>20,c("mpg","hp")]
#same effect
mtcars[mtcars[,1]>20,c(1,4)]

#or store selected criteria into variables
mpg20 <- mtcars[,1]>20
col_select <- c(1,4)
mtcars[mpg20, col_select]


################    subset() 		######################
#works with vectors, matrices, and data frames

#same as 
#mtcars[mtcars[,1]>20,c(1,4)]
subset(mtcars, mpg>20, c("mpg","hp"))

#return entire row for the max(mpg)
subset(mtcars, mpg==max(mpg))
#show only mpg col for criteria
subset(mtcars, mpg==max(mpg), mpg)

#same results
#all rows, note the extra comma, include cols mpg and hp
test1 <- subset(mtcars, , c("mpg", "hp"))
#use select=c()
test2 <- subset(mtcars, select=c("mpg", "hp"))

#use dplyr package
#only col name is required
library(dplyr)
filter(mtcars, mpg>20)
select(mtcars, mpg, hp)

# You can also combine filter and subset with the dplyr %.% 
# "chaining" operation that allows you to string together 
# multiple commands on a data frame. 
# The chaining syntax in general is:
  
dataframename %>% firstfunction(argument for first function) %>% 
secondfunction(argument for second function) %>% thirdfunction(argument for third function)

##same results, filter, select columns and sort in 2 lines
test3 <- mtcars %>% filter(mpg>20) %>%
select(mpg,hp) %>% arrange(desc(mpg))

##### data viz

#scatterplot
plot(mtcars$disp, mtcars$mpg)

#add labels and title
plot(mtcars$disp, mtcars$mpg, xlab="Engine displacement", ylab="mpg", 
     main="MPG compared with engine displacement")

#rotate the y axis numbering
plot(mtcars$disp, mtcars$mpg, xlab="Engine displacement", ylab="mpg", 
     main="MPG vs engine displacement", las=1)

#use ggplot2
library(ggplot2)
qplot(disp, mpg, data=mtcars)
#change y axis to start at 0
qplot(disp, mpg, ylim=c(0,35), data=mtcars)


#aes - aesthetics space, color, shape
#geom - lines, bars, shapes

ggplot(mtcars, aes(x=disp, y=mpg)) + geom_point()
#change to line chart 
ggplot(mtcars, aes(x=disp, y=mpg)) + geom_line()
#both line and point chart
ggplot(mtcars, aes(x=disp, y=mpg)) + geom_line() + geom_point()

#Bar chart
barplot(BOD$demand)
#with title and x axis labels
barplot(BOD$demand, main="Graph of Demand", names.arg = BOD$Time)

#generate frequencies and counts based raw data
cylcount <- table(mtcars$cyl)
barplot(cylcount)

qplot(mtcars$cyl)
#use cylinders as groups
qplot(factor(mtcars$cyl))
#use ggplot
ggplot(mtcars, aes(factor(cyl))) + geom_bar() 
#use rainbow fill of 3 colors
ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill=rainbow(3)) 

#histogram
hist(mtcars$mpg, breaks = 2)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=5)

#boxplots
boxplot(mtcars$mpg)

#correlation matrix - use package corrplot

#adding colors conditionally
testcolors <- ifelse(testscores >= 80, "blue", "red")
barplot(testscores, col=testcolors)
barplot(testscores, col=testcolors, main="Test scores", ylim=c(0,100))
barplot(testscores, col=testcolors, main="Test scores", ylim=c(0,100), las=1)


qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(cyl))

#Run SQL in R
library(sqldf)
sqldf("select * from mtcars where mpg > 20 group by cyl order by mpg desc ")

#write data in R 

