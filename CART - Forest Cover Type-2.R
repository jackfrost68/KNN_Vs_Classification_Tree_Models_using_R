library(caret)
library(rpart)
library(rpart.plot)
source('/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /Data/BabsonAnalytics.r')

#LOAD 
df = read.csv("/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /forest-cover-type-prediction/train.csv")


#MANAGE
df$Id= NULL
df$Hillshade_9am = as.numeric(df$Hillshade_9am)
df$Hillshade_Noon = as.numeric(df$Hillshade_Noon)
df$Hillshade_3pm = as.numeric(df$Hillshade_3pm)
df$Wilderness_Area1 = as.factor(df$Wilderness_Area1)
df$Wilderness_Area2 = as.factor(df$Wilderness_Area2)
df$Wilderness_Area3 = as.factor(df$Wilderness_Area3)
df$Wilderness_Area4 = as.factor(df$Wilderness_Area4)
df$Soil_Type1 = as.factor(df$Soil_Type1)
df$Soil_Type2 = as.factor(df$Soil_Type2)
df$Soil_Type3 = as.factor(df$Soil_Type3)
df$Soil_Type4 = as.factor(df$Soil_Type4)
df$Soil_Type5 = as.factor(df$Soil_Type5)
df$Soil_Type6 = as.factor(df$Soil_Type6)
df$Soil_Type7 = as.factor(df$Soil_Type7)
df$Soil_Type8 = as.factor(df$Soil_Type8)
df$Soil_Type9 = as.factor(df$Soil_Type9)
df$Soil_Type10 = as.factor(df$Soil_Type10)
df$Soil_Type11 = as.factor(df$Soil_Type11)
df$Soil_Type12 = as.factor(df$Soil_Type12)
df$Soil_Type13 = as.factor(df$Soil_Type13)
df$Soil_Type14 = as.factor(df$Soil_Type14)
df$Soil_Type15 = as.factor(df$Soil_Type15)
df$Soil_Type16 = as.factor(df$Soil_Type16)
df$Soil_Type17 = as.factor(df$Soil_Type17)
df$Soil_Type18 = as.factor(df$Soil_Type18)
df$Soil_Type19 = as.factor(df$Soil_Type19)
df$Soil_Type20 = as.factor(df$Soil_Type20)
df$Soil_Type21 = as.factor(df$Soil_Type21)
df$Soil_Type22 = as.factor(df$Soil_Type22)
df$Soil_Type23 = as.factor(df$Soil_Type23)
df$Soil_Type24 = as.factor(df$Soil_Type24)
df$Soil_Type25 = as.factor(df$Soil_Type25)
df$Soil_Type26 = as.factor(df$Soil_Type26)
df$Soil_Type27 = as.factor(df$Soil_Type27)
df$Soil_Type28 = as.factor(df$Soil_Type28)
df$Soil_Type29 = as.factor(df$Soil_Type29)
df$Soil_Type30 = as.factor(df$Soil_Type30)
df$Soil_Type31 = as.factor(df$Soil_Type31)
df$Soil_Type32= as.factor(df$Soil_Type32)
df$Soil_Type33 = as.factor(df$Soil_Type33)
df$Soil_Type34 = as.factor(df$Soil_Type34)
df$Soil_Type35 = as.factor(df$Soil_Type35)
df$Soil_Type36 = as.factor(df$Soil_Type36)
df$Soil_Type37 = as.factor(df$Soil_Type37)
df$Soil_Type38 = as.factor(df$Soil_Type38)
df$Soil_Type39 = as.factor(df$Soil_Type39)
df$Soil_Type40 = as.factor(df$Soil_Type40)
df$Cover_Type = as.factor(df$Cover_Type)

#PARTITION
N = nrow(df)
training_size = round(N*0.6)
set.seed(1234)
training_cases = sample(N, training_size)
train = df[training_cases,]
test = df[-training_cases,]

#BUILD
library(rpart)
stopping_rules = rpart.control(minsplit = 0, minbucket = 0, cp = -1)
model = rpart(Cover_Type ~ . , data =train, control = stopping_rules)

#PREDICT
predictions = predict(model, test, type="class")

##Evaluate
observations = test$Cover_Type
table(predictions, observations)

error_rate = sum(predictions!=test$Cover_Type)/nrow(test)
error_bench = benchmarkErrorRate(train$Cover_Type,test$Cover_Type)

##PRUNING
model = easyPrune(model)
rpart.plot(model)

#PREDICT
predictions = predict(model, test, type="class")

##Evaluate
observations = test$Cover_Type
table(predictions, observations)

error_rate_pruned = sum(predictions !=test$Cover_Type)/nrow(test)
accuracy_rate = 1-error_rate
accuracy_rate_pruned = 1-error_rate_pruned

