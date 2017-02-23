#testing code from http://stats.seandolinar.com/collecting-twitter-data-getting-started/

filterStream( file.name="tweets_test.json",
              track="McDonalds", tweets=5000, oauth=Cred, timeout=10000, lang='en' )

#Parses the tweets
tweet_df <- parseTweets(tweets='tweets_test.json')

#using the Twitter data frame
tweet_df$created_at
tweet_df$text


plot(tweet_df$friends_count, tweet_df$followers_count) #plots scatterplot
cor(tweet_df$friends_count, tweet_df$followers_count) #returns the correlation coefficient

