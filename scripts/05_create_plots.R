
#####################################################################
## average rating by movie compared to average rating of the data set
#####################################################################

mu_hat <- mean(edx_train$rating)

plot_avg_rating <- movie_avgs <- edx_train %>%
  group_by(movieId) %>%
  summarise(b_i = mean(rating - mu_hat))

qplot(b_i, data = movie_avgs, bins = 10, color = I("black"))


##########################
## average rating by user
##########################

mu_hat <- mean(edx_train$rating)

plot_avg_user <- edx_train %>% 
  group_by(userId) %>%
  summarise(b_u = mean(rating - mu_hat)) %>%
  filter(n() >= 100) %>%
  ggplot(aes(b_u)) +
  geom_histogram(bins = 30, color = "black")


#####################################
## average rating by year of release
#####################################

mu_hat <- mean(edx_train$rating)

plot_release <- edx_train %>% 
  group_by(year) %>%
  summarise(b_y = mean(rating - mu_hat)) %>%
  ggplot(aes(b_y)) +
  geom_histogram(bins = 30, color = "black")

#####################################
## average rating by date of review
#####################################

mu_hat <- mean(edx_train$rating)

plot_review <- edx_train %>% 
  group_by(date) %>%
  summarise(b_d = mean(rating - mu_hat)) %>%
  ggplot(aes(b_d)) +
  geom_histogram(bins = 20, color = "black")

#####################################
## average rating by genres
#####################################

mu_hat <- mean(edx_train$rating)

plot_genre <- edx_train %>% 
  group_by(genres) %>%
  summarise(b_g = mean(rating - mu_hat)) %>%
  ggplot(aes(b_g)) +
  geom_histogram(bins = 20, color = "black")

#####################################
##count by genres
#####################################

### separate genres
edx_genre <- edx %>% separate_rows(genres, sep = "\\|")

plot_genre_count <- edx_genre %>% group_by(genres) %>%
     summarise(Count = n()) %>%
     ggplot(aes(x=reorder(genres,-Count), y=Count)) +
     geom_col(aes(fill=genres)) +
     theme(axis.text.x = element_text(angle=30, vjust=0.8))