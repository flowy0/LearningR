# Load the dplyr package
library(dplyr)

# Load the hflights package
library(hflights)

# Call both head() and summary() on hflights
head(hflights)
summary(hflights)
str(hflights)

hflights <-tbl_df(hflights)
glimpse(hflights)

# Both the dplyr and hflights packages are loaded

# Convert the hflights data.frame into a hflights tbl
hflights <-tbl_df(hflights)

# Display the hflights tbl
hflights



# To do this, let's work with a lookup table, that comes in the form of a named vector. 
# When you subset the lookup table with a character string 
# (like the character strings in UniqueCarrier), 
# R will return the values of the lookup table that correspond to the names in the character string. 
# To see how this works, run following code in the console:

two <- c("AA", "AS")
lut <- c("AA" = "American", 
"AS" = "Alaska", 
"B6" = "JetBlue")
two <- lut[two]
two



# Create the object carriers
carriers <- hflights$UniqueCarrier

# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")
#add the lookup
# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)



# The hflights tbl you built in the previous exercise is available in the workspace.


# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Add the Code column
hflights$Code <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)

# Glimpse at hflights
