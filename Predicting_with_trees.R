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

modFit<-train(Species ~. ,method="rpart", data=training)
print(modFit$finalModel)
plot(modFit$finalModel,uniform=T,main="classification Tree")
text(modFit$finalModel,use.n = T,all = T,cex=0.8)

#install.packages("rattle")
install.packages("rpart.plot")
library(rattle)
fancyRpartPlot(modFit$finalModel)
t