

#import CSV
setwd("D:\\Github\\Movie-Ratings")
movies <- read.csv("Movie-Ratings.csv")

head(movies)

colnames(movies) <- c("Films","Genre","CriticRating","AudienceRating","BudgetMillion","Year")
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

library(ggplot2)

#Scatter with Smooth by Critic Rating & Audience Rating

t <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
t + geom_point() + geom_smooth(fill=NA)



#Boxplots with Jitter by Critic Rating & Genre
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_jitter(aes(y=CriticRating)) + geom_boxplot(aes(y=CriticRating),size=1.2, alpha=0.5) + ylab("CriticRating")



#Facets by Genre & Year
v <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
            colour=Genre))

v + geom_point(aes(size=BudgetMillion)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))



#Histogram by Moviess & Budget
m <- ggplot(data=movies, aes(x=BudgetMillion))
n <- m + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
n + xlab("Budget") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red",size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1), 
          
        plot.title = element_text(colour="DarkBlue", size=40))
