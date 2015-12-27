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
test_data1=testing[1,]
test_data1$TotalIntench2<-23000
test_data1$FiberWidthCh1 <- 10
test_data1$PerimStatusCh1<-2

#test data 2
test_data2=testing[1,]
test_data2$TotalIntench2<-50000
test_data2$FiberWidthCh1 <- 10
test_data2$VarIntenCh4 <-100

#test data 3
test_data1=testing[1,]
test_data1$TotalIntench2<- 57000
test_data1$FiberWidthCh1 <- 10
test_data1$PerimStatusCh1<-2

#test data 4
test_data1=testing[1,]
test_data1$TotalIntench2<- 57000
test_data1$FiberWidthCh1 <- 10
test_data1$PerimStatusCh1<-2
result1<-predict(modFit,newdata = test_data1)
print(result1)
