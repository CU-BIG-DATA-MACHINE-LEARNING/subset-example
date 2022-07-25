install.packages("randomForest")
library(randomForest)
AirlinePassengers<- read.csv('C:/Users/terra/projects/ColumbiaUniversity/ClassificationExamples/airlinePassengerSatisfaction/train.csv')
SatisfactionData<- data.frame(DepDelay=AirlinePassengers$Departure.Delay.in.Minutes,  #subset of data
                              ArrDelay=AirlinePassengers$Arrival.Delay.in.Minutes, 
                              Satisfaction=AirlinePassengers$satisfaction, 
                              stringsAsFactors = T)
data<-na.omit(SatisfactionData)  #removing of empty data sets


RFM = randomForest(Satisfaction ~.,data) #creating of MLM based on data subset

ggplot(data, aes(x=DepDelay, y=ArrDelay, fill=Satisfaction))+ geom_tile()

predictionData<- data.frame(DepDelay=0, ArrDelay=0) 

predict(RFM, predictionData)

