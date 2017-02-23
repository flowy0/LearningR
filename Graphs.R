dat <- data.frame( fruit=c("Apple", "Apple", "Orange", "Orange", "Orange", "Orange",
                           "Orange", "Pear", "Pear", "Pear"), variable=c("Present", "Absent",
                                                                         "Present", "Present", "Present", "Present", "Absent", "Absent",
                                                                         "Absent", "Present") )  

# stacked bar plot  
ggplot(dat, aes(x = fruit, fill = variable) ) +  
  geom_bar( aes(y = ..count..*100/sum(..count..) ) ) +  
  
  labs(x = "Fruit", y = "Percentage %") +  
  scale_fill_manual("Condition", values = alpha( c("firebrick", "dodgerblue4"), 1) )  

# with faceting  
ggplot(dat, aes(x = variable, fill = variable) ) +   
  geom_bar( aes(y = ..count..*100/sum(..count..) ) ) +   
  facet_grid(. ~ fruit) +  
  
  labs(x = "Condition", y = "Percentage %") +  
  scale_fill_manual("Condition", values = alpha( c("firebrick", "dodgerblue4"), 1) )# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, position="dodge")

# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

# Density plots with semi-transparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)