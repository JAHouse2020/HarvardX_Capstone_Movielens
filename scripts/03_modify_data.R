########################################
## create field ‘year’ from movie title
########################################

edx$year<-substr(edx$title,nchar(as.character(edx$title))-4,nchar(as.character(edx$title))-1)
edx$title<-paste0(substr(edx$title,1,nchar(as.character(edx$title))-6))

validation$year<-substr(validation$title,nchar(as.character(validation$title))-4,nchar(as.character(validation$title))-1)
validation$title<-paste0(substr(validation$title,1,nchar(as.character(validation$title))-6))

###############################################
## change timestamp from unix to year-month as ‘date’
## remove timestamp
###############################################

edx$timestamp <- anytime(edx$timestamp)
edx$date <- substr(edx$timestamp, 1, 7)
edx <- edx %>% select(!timestamp)


validation$timestamp <- anytime(validation$timestamp)
validation$date <- substr(validation$timestamp, 1, 7)
validation <- validation %>% select(!timestamp)
