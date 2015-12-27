#install.packages("randomForest")
data(iris);
library(ggplot2);
names(iris)
table(iris$Species)
library(caret)
intrain<-createDataPartition(y=iris$Species, p=0.7, list=FALSE)
training<-iris[intrain,]
testing<-iris[-intrain,]
dim(testing);dim(training);
qplot(Petal.Width,Sepal.Width,colour=Species, data=training)
modFit<-train(Species ~. ,method="rf", data=training,prox=T)
print(modFit)
getTree(modFit$finalModel,k=2)

pred<-predict(modFit,testing)
testing$predRight<-pred==testing$Species
table(pred,testing$Species)
qplot(Petal.Width,Sepal.Width,colour=predRight, data=testing)
