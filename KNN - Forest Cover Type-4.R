library(caret)
source('/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /Data/BabsonAnalytics.r')

#LOAD 
df = read.csv("/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /forest-cover-type-prediction/train.csv")

#MANAGE
df$Id= NULL
df$Hillshade_9am = as.numeric(df$Hillshade_9am)
df$Hillshade_Noon = as.numeric(df$Hillshade_Noon)
df$Hillshade_3pm = as.numeric(df$Hillshade_3pm)
df$Wilderness_Area1 = NULL
df$Wilderness_Area2 = NULL
df$Wilderness_Area3 = NULL
df$Wilderness_Area4 = NULL
df$Soil_Type1 = NULL
df$Soil_Type2 = NULL
df$Soil_Type3 = NULL
df$Soil_Type4 = NULL
df$Soil_Type5 = NULL
df$Soil_Type6 = NULL
df$Soil_Type7 = NULL
df$Soil_Type8 = NULL
df$Soil_Type9 = NULL
df$Soil_Type10 = NULL
df$Soil_Type11 = NULL
df$Soil_Type12 = NULL
df$Soil_Type13 = NULL
df$Soil_Type14 = NULL
df$Soil_Type15 = NULL
df$Soil_Type16 = NULL
df$Soil_Type17 = NULL
df$Soil_Type18 = NULL
df$Soil_Type19 = NULL
df$Soil_Type20 = NULL
df$Soil_Type21 = NULL
df$Soil_Type22 = NULL
df$Soil_Type23 = NULL
df$Soil_Type24 = NULL
df$Soil_Type25 = NULL
df$Soil_Type26 = NULL
df$Soil_Type27 = NULL
df$Soil_Type28 = NULL
df$Soil_Type29 = NULL
df$Soil_Type30 = NULL
df$Soil_Type31 = NULL
df$Soil_Type32= NULL
df$Soil_Type33 = NULL
df$Soil_Type34 = NULL
df$Soil_Type35 = NULL
df$Soil_Type36 = NULL
df$Soil_Type37 = NULL
df$Soil_Type38 = NULL
df$Soil_Type39 = NULL
df$Soil_Type40 = NULL
df$Cover_Type = as.factor(df$Cover_Type)

#standardizing the remaining numeric variables
standardizer = preProcess(df,method =c("center","scale"))
df = predict(standardizer, df)

#PARTITION
N = nrow(df)
training_size = round(N*0.7)
set.seed(1234)
training_cases = sample(N, training_size)
training = df[training_cases, ]
test = df[-training_cases,]

#MODEL
k_value = knnCrossVal(Cover_Type ~ ., training)
model = knn3(Cover_Type ~ ., data=training, k = k_value)

#PREDICT
predictions = predict(model, test, type = "class")

#EVALUATE 
observations = test$Cover_Type
table(predictions,observations)

accuracy_rate = sum(predictions == observations)/nrow(test)

error_rate = 1 - accuracy_rate

error_bench = benchmarkErrorRate(training$Cover_Type, test$Cover_Type)


