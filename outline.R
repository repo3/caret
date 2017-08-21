# https://www.youtube.com/watch?v=7Jbb2ItbTC4
# https://www.youtube.com/watch?v=dB-JHhEJvQA

library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,p=0.75,list=FALSE)
training <- spam[inTrain,]
testing  <- spam[-inTrain,]

dim(training)
dim(testing)

set.seed(32343)
modelFit <- train(type~.,data=training,method="glm")
modelFit
modelFit$finalModel

predictions <- predict(modelFit,newdata=testing)
#predictions

confusionMatrix(predictions,testing$type)
