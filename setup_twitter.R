download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
requestURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authURL<-"https://api.twitter.com/oauth/authorize"


consumerKey = "5VANQpqilXMsHg67Z1YUbrSBx"
consumerSecret = "xIUq5B2jM8M6Oifmb41RRU2LXGHvMuZYq7QmgwaOmbYOP5L29V"
Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=requestURL,
                         accessURL=accessURL, 
                         authURL=authURL)




Cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl") )
# Comments:This is a very important step; you need to copy the url and #paste to internet browser, 
#then copy the code to R, follow the video to #complete this step.
save(Cred, file="twitter authentication.Rdata") 
accessToken <- "9295452-Yt96bbaIY03WnYJMcJR9WTywpEdIv5Qd4NQEwN6xjH"
accessTokenSecret <- "mtd06YbyWVOiJRLfKvg88TSfXEZYkkUYbuVJu9Qb1d1MY"
setup_twitter_oauth (consumerKey,consumerSecret,accessToken,accessTokenSecret)