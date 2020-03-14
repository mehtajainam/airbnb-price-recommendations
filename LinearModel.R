library(MASS)
library(dplyr)

# Load data
airnbn.train <- read.csv('/Users/bazarkhanjumagulov/Desktop/DataMiningPrinciples/Project/train.csv',
                         header=TRUE, sep=',')
airnbn.test <- read.csv('/Users/bazarkhanjumagulov/Desktop/DataMiningPrinciples/Project/test.csv',
                        header=TRUE, sep=',')
dim(airnbn.train)
dim(airnbn.test)

# Function to measure R^2
r2 <- function(pred.y, true.y){
  sst = sum((true.y - mean(true.y))^2)
  sse = sum((pred.y - true.y)^2)
  return(1-sse/sst)
}

# Log transform on features and target
airnbn.train$logprice<-log(airnbn.train$price)
airnbn.test$logprice<-log(airnbn.test$price)
# Build model
LinearModelFinal<-lm(logprice~accommodates+
                         zipcode+
                         room_type, 
                       data = airnbn.train)
summary(LinearModelFinal)$r.squared
summary(LinearModelFinal)
# Fill in missing levels for variables
LinearModelFinal$xlevels[["neighbourhood_cleansed"]] <- union(levels(airnbn.train$neighbourhood_cleansed),
                                                              levels(airnbn.test$neighbourhood_cleansed))
LinearModelFinal$xlevels[["zipcode"]] <- union(levels(airnbn.train$zipcode),
                                               levels(airnbn.test$zipcode))
LinearModelFinal$xlevels[["property_type"]] <- union(levels(airnbn.train$property_type),
                                                     levels(airnbn.test$property_type))
colnames(airnbn.train)
colnames(airnbn.test)
# Evaluation on the train set
print(paste0("Train R2 (log): ", summary(LinearModelFinal)$r.squared))
print(paste0("Train R2: ", r2(exp(LinearModelFinal$fitted.values), airnbn.train$price)))


# Predict and evaluation on test set
predTest = predict(LinearModelFinal, newdata = airnbn.test[,c(-1,-38)])
head(predTest)
print(paste0("Test R2 (log): ", r2(predTest, airnbn.test$logprice)))
print(paste0("Test R2: ", r2(exp(predTest), airnbn.test$price)))

result<-data.frame(airnbn.test$id,airnbn.test$price, exp(predTest), residuals = airnbn.test$price - exp(predTest))
#result<-cbind(airnbn.test$id,result)


averageErrorAbs<-sum(abs(result$residuals))/8481
averageErrorAbs
averPrice<-sum(airnbn.test$price)/8481
averPrice

MAPE<-sum(abs(airnbn.test$price - exp(predTest))/airnbn.test$price)/8481
MAPE

head(result)
dim(result)


dataPath<-"/Users/bazarkhanjumagulov/Desktop/DataMiningPrinciples/Project/"
write.table(result, file = paste(dataPath,'resultLMod.csv',sep = '/'), row.names = F)

#Historgram Price
hist(airnbn.train$price,xlab = "Price",
     main = paste("Histogram of Airnbn Price"))

cor(airnbn.train$logprice, airnbn.train$accommodates) # 0.5282803
#cor(airnbn.train$logprice, airnbn.train$zipcode)
#head(airnbn.train$room_type[111:140])
#str(airnbn.train$room_type)
#plot(LinearModelFinal)
#Return

#Regression Model Diagnostics
require(MASS)
#require(clusterGeneration)
library(car)
## Evaluate collinearity
vif(LinearModelFinal)
layout(matrix(1:4, 2, 2))
plot(LinearModelFinal)
options(repr.plot.width = 4, repr.plot.height = 4)







