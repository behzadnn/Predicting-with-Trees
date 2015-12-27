install.packages("pgmm")
library(pgmm)
data(olive)
library(caret)
library(ggplot2);

names(olive)

table(olive$Area)
table(olive$Region)
intrain<-createDataPartition(y=olive$Area, p=0.7, list=FALSE)
training<-olive[intrain,]
testing<-olive[-intrain,]
dim(testing);
dim(training);
#qplot( Palmitic , Region ,colour=Area, data=olive)
set.seed(125)
modFit<-train(Area ~. ,method="rpart", data=training)
print(modFit$finalModel)
plot(modFit$finalModel,uniform=T,main="classification Tree")
text(modFit$finalModel,use.n = T,all = T,cex=0.8)

#install.packages("rattle")
#install.packages("rpart.plot")
library(rattle)
fancyRpartPlot(modFit$finalModel)

result<-predict(modFit,newdata = as.data.frame(t(colMeans(olive))))
print(result)
