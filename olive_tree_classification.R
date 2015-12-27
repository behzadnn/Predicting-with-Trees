install.packages("pgmm")
library(pgmm)
data(olive)
library(caret)
library(ggplot2);

names(olive)

table(olive$Area)
table(olive$Region)
intrain<-createDataPartition(y=segmentationOriginal$Class, p=0.5, list=FALSE)
#training<-segmentationOriginal[-intrain,]
#testing<-segmentationOriginal[intrain,]
training<-segmentationOriginal[segmentationOriginal$Case=="Train",]
testing<-segmentationOriginal[segmentationOriginal$Case=="Test",]
dim(testing);
dim(training);
qplot( TotalIntenCh2 , FiberWidthCh1 ,colour=Class, data=segmentationOriginal)
set.seed(125)
modFit<-train(Class ~. ,method="rpart", data=training)
print(modFit$finalModel)
plot(modFit$finalModel,uniform=T,main="classification Tree")
text(modFit$finalModel,use.n = T,all = T,cex=0.8)

#install.packages("rattle")
#install.packages("rpart.plot")
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
test_data3=testing[1,]
test_data3$TotalIntench2<- 57000
test_data3$FiberWidthCh1 <- 8
test_data3$VarIntenCh4<-100

#test data 4
test_data4=testing[1,]
test_data4$FiberWidthCh1 <- 8
test_data4$VarIntenCh4<-100
test_data4$PerimStatusCh1<-2

result1<-predict(modFit,newdata = test_data1)
print(result1)

result2<-predict(modFit,newdata = test_data2)
print(result2)

result3<-predict(modFit,newdata = test_data3)
print(result3)

result4<-predict(modFit,newdata = test_data4)
print(result4)
