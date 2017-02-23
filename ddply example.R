library(dplyr)
library(plyr)

df <- data.frame(
  variable = rep(letters[1:10], 2),
  y2 = 1:10,
  y1 = c(10, 9, 8 ,7, 6, 5, 4, 2, 1, 3),
  stat = c(rep(letters[1], 10), rep(letters[2], 10))
)



ddply(df, .(stat), mutate,
      y1rank = rank(y1),

)