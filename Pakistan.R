getwd()
setwd("C:/Users/KEVIN/Desktop/Pakistan_data")
data <- read.csv('University_data.csv')


#Summary of the data
summary(data)

#University data

length(unique(data$University))
#Total number of universities 227
length(unique(data$Location))
#Locations where we have the universities

length(unique(data$Province))
#Province where we have the universities
length(unique(data$Campuses))
#Campuses accross
length(unique(data$Specialization))
#Areas of specialization
length(unique(data$Type))
#The university classification

#Establishment per year

yearly <- aggregate(Type ~ Established, data = data, FUN = length)
yearly

#Significant years
head(yearly[order(-yearly$Type),],10)

#visualization
library(ggplot2)
province <- aggregate(Type ~ Province, data = data, FUN = length)
head(province)

prov <- ggplot(province, aes(x = Province, y = Type, fill=Type))
prov + geom_bar(stat = 'identity', width = 0.4) +
  labs(title = "Number of Universities per Province",
       y ='Count of University') +
  theme(legend.position = 'None',
        plot.title = element_text(size = 12,
                                  face = 'bold',
                                  hjust=0.5),
        axis.text.x = element_text(size = 8), angle = 30))


specialization <- aggregate(Type ~ Specialization, data = data, FUN = length)
specialization

spec <- ggplot(specialization, aes(x = Specialization, y = Type, fill = Type))
spec + geom_bar(stat='identity', width = 0.4) +
  labs(title = "Specialization Distribution",
       y ='Count of University') +
  theme(legend.position = 'None',
        plot.title = element_text(size = 12,
                                  face = 'bold',
                                  hjust = 0.5),
        axis.text.x = element_text(vjust = 0.9,size = 10, angle = 20))




