# hflights is pre-loaded as a tbl, together with the necessary libraries.
delay1 <- select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)
# Print out a tbl with the four columns of hflights related to delay
delay1

# Print out the columns Origin up to Cancelled of hflights
hflights2 <- select(hflights, Origin:Cancelled)
hflights2


# Find the most concise way to select: columns Year up to and including DayOfWeek, 
# columns ArrDelay up to and including Diverted. 
# You can examine the order of the variables in hflights with names(hflights) in the console.

# Answer to last question: be concise!
hflights3 <- select(hflights, Year:DayOfWeek, ArrDelay:Diverted)


# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl containing just ArrDelay and DepDelay
hflights4<- select(hflights, ArrDelay, DepDelay)
hflights4

#Use a combination of helper functions and variable names to print out only the 
#UniqueCarrier, FlightNum, TailNum, Cancelled, and CancellationCode columns of hflights.
# Print out a tbl as described in the second instruction, using both helper functions and variable names
hflights5 <- select(hflights, UniqueCarrier, contains("Num"), contains("Cancel") )
print(hflights5)

# Find the most concise way to return the following columns with select and its helper functions: 
#   DepTime, ArrTime, ActualElapsedTime, AirTime, ArrDelay, DepDelay
# Print out a tbl as described in the third instruction, using only helper functions.
hflights6 <- select(hflights, contains("Time"), contains("Delay"))
hflights6



# both hflights and dplyr are available

# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, contains("Taxi"), Distance)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, Year:ArrTime, -DayofMonth)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, starts_with("T"))