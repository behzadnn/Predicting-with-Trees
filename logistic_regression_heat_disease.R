library(ElemStatLearn)
data(SAheart)
set.seed(8484)
names(SAheart)

table(SAheart$chd)
table(SAheart$age)

train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

dim(trainSA);
dim(testSA);
qplot( age , tobacco ,colour=chd, data=SAheart)
set.seed(13234)
modFit<-train(chd ~age+alcohol+obesity+typea+ldl+tobacco,method="glm",family="binomial", data=trainSA)
print(modFit$finalModel)
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

prediction_testing<-predict(modFit,newdata = testSA)
values_testing<-testSA$chd
result_testing<-missClass(values_testing,prediction_testing)
prediction_training<-predict(modFit,newdata = trainSA)
values_training<-trainSA$chd
result_training<-missClass(values_training,prediction_training)
print(result_testing)
print(result_training)
