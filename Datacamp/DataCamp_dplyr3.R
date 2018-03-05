# hflights and dplyr are loaded in the workspace

# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted == 1), max_div = max(Distance))

# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest=min(ArrDelay), average=mean(ArrDelay),  latest=max(ArrDelay), sd=sd(ArrDelay) )

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn) & !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff=max(abs(TaxiIn-TaxiOut))   )


# hflights is available with full names for the carriers


# Print out a summary of hflights with the following variables:
#   n_obs: the total number of observations,
# n_carrier: the total number of carriers,
# n_dest: the total number of destinations,
# aa, a tbl with all flights flown by American Airlines, is already available.
# Print out a summary of aa with the following variables:
#   n_flights: the total number of flights (each observation is a flight),
# n_canc: the total number of cancelled flights,
# avg_delay: the average arrival delay of flights whose delay is not NA (na.rm = TRUE).






# Generate summarizing statistics for hflights
summarise(hflights,
          n_obs = n(),
          n_carrier = n_distinct(UniqueCarrier),
          n_dest = n_distinct(Dest)
)

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarise(aa, 
          n_flights = n(),
          n_canc=sum(Cancelled ==1),
          avg_delay = mean(ArrDelay, na.rm=TRUE))


# hflights and dplyr are both loaded and ready to serve you



# Write the 'piped' version of the English sentences.
hflights %>%
  mutate(diff= TaxiOut-TaxiIn) %>%
  filter(!is.na(diff)) %>%
  summarise(avg= mean(diff))

# Chain together mutate(), filter() and summarise()

hflights %>%
  mutate(RealTime=ActualElapsedTime+100, mph = Distance/RealTime *60) %>%
  filter(!is.na(mph) & mph <70) %>%
  summarise(n_less = n(), n_dest=n_distinct(Dest), min_dist=min(Distance), max_dist=max(Distance))


# filter() the result of mutate to:
#   keep observations that have an mph under 105 or for which Cancelled equals 1 or for which Diverted equals 1.
# summarise() the result by creating four summary variables:
#   n_non, the number of observations,
# n_dest, the number of destinations,
# min_dist, the minimum distance and
# max_dist, the maximum distance.
# Finish the command with a filter() and summarise() call
hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
  filter(mph <105 | Cancelled==1 | Diverted ==1) %>%
  summarise(n_non=n(), n_dest=n_distinct(Dest), min_dist=min(Distance), max_dist=max(Distance)
  )


# filter() the hflights tbl to keep only observations whose DepTime is not NA, 
#whose ArrTime is not NA and for which DepTime exceeds ArrTime.
# Pipe the result into a summarise() call to create a single summary variable: 
#num, that simply counts the number of observations.
# # hflights and dplyr are loaded

# Count the number of overnight flights
hflights %>%
  filter(!is.na(DepTime) & !is.na(ArrTime)) %>%
  filter(DepTime>ArrTime) %>%
  summarise(num=n())

# filter() the hflights tbl to only keep observations for which ArrDelay is not NA and positive.
# Use group_by() on the result to group by UniqueCarrier.
# Next, use summarise() to calculate the average ArrDelay per carrier. Call this summary variable avg.
# Feed the result into a mutate() call: create a new variable, rank, calculated as rank(avg).
# Finally, arrange by this new rank variable


filter(hflights, ArrDelay>0, !is.na(ArrDelay)) %>%
  group_by(UniqueCarrier) %>%
  summarise(avg= mean(ArrDelay)) %>%
  mutate(rank=rank(avg)) %>%
  arrange(rank)


# dplyr and hflights (with translated carrier names) are pre-loaded

# How many airplanes only flew to one destination?
hflights %>%
  group_by(TailNum) %>%
  summarise(ndest = n_distinct(Dest)) %>%
  filter(ndest == 1) %>%
  summarise(nplanes = n())

# Find the most visited destination for each carrier
hflights %>% 
  group_by(UniqueCarrier, Dest) %>%
  summarise(n = n()) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1)

# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
  group_by(carrier) %>%
  summarise(n_flights = n(), avg_delay = mean(arr_delay)) %>%
  arrange(avg_delay)
