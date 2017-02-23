#dplyr tutorial
#https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
#install.packages("nycflights13)

library(nycflights13)
dim(flights)
head(flights)
data1 <- filter(flights, month==1 | month==2, day ==1)

#slice function - selects rows by position
slice(flights, 1:10)

#arrange
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

#select column by name
select(flights, year, month, day)
#using a range
select(flights, year:day)

