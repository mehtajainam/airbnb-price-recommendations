train = read.csv("C:/Users/Rameez/Dropbox/UChicago_Assignments/Data Mining/train.csv")
test = read.csv("C:/Users/Rameez/Dropbox/UChicago_Assignments/Data Mining/test.csv")

library(poLCA)
library(ggplot2)

train = train[,4:ncol(train)]
test = test[,4:ncol(test)]
head(train)
head(test)

set.seed(1000)




#Declare formula for LCA
f = cbind(Wifi, Heating, Kitchen, Airconditioning, TV, Refrigerator, Washer, Dryer, Dishesandsilverware, Stove, Microwave, Oven, Freestreetparking, Internet, Elevator, Kidfriendly, CableTV, Dishwasher, Gym)~1

#Calculate AIC
train_aic= 2:10
for (i in 2:10){
  train_aic[i] = poLCA(f,train,nclass=i,nrep=100,tol=.001,verbose=FALSE, graphs=FALSE)$aic
}

#Calculate BIC
train_bic= 2:10
for (i in 2:10){
  train_bic[i] = poLCA(f,train,nclass=i,nrep=100,tol=.001,verbose=FALSE, graphs=FALSE)$bic
}

train_clusters = data.frame(cbind(Clusters=2:10, train_bic= train_bic[2:10], train_aic= train_aic[2:10]))
train_clusters

matplot(train_clusters[2:3], type = "b")
