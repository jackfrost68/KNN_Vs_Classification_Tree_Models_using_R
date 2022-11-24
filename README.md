# KNN Vs Classification Tree Models
Comparing model performance for predicting forest cover types

Dataset: [(https://www.kaggle.com/c/forest-cover-type-prediction)]

<ins>*Introduction:*</ins>

In this paper, I build upon my [findings from the EDA process.](https://github.com/jackfrost68/EDA_of_the_Forest_Cover_Type_Dataset_Using_Tableau.git) First, I construct two separate models i.e. KNN and a Classification Tree to predict using my dataset. Thereafter, I implement different controlling strategies that prevent my models from being overfit/too complex. Lastly, I evaluate their performances, review the pros and cons of each model and then choose the most appropriate one for my dataset.

<ins>*KNN Model Construction:*</ins>

After loading my dataset into R-Studio, I managed the dataset. Since KNN models predict based on distance of variables, the inputs have to be numerical e.g. elevation, aspect, slope. Therefore, I dropped all other categorical variables e.g. ID, Wilderness_Area, Soil_Type, except the Hillshade and Cover_Type, which is my target (what I’m trying to predict).

![This is an image]()

<ins>*KNN Model Interpretation:*</ins> 

After standardizing the remaining numerical variables, setting seed to 1234, and partitioning my model on a 60-40 training-test split, I created my model using K=1 based on knnCrossVal() which predicts best possible value (where K is the distance between the numerical variables). After running the models, I have the following matrix; 

![This is an image]()

From it, we can infer that my model predicted 386 times when Forest Cover type 1 was and was actually the correct Forest Cover Type in the observations split of the testing dataset. On the flip side, we can infer that the number of times my model predicted forest cover type 7 as it was in the test split, was 624. 

Additionally, the result shows that I could choose K around 1 , which will get the highest cross-validation accuracy.

![This is an image]()

<ins>*KNN Performance Evaluation:*</ins> 

After running my model, I calculated the accuracy rate - how often my model predicted the cover type correctly. The KNN model predicted a  75% accuracy rate and a 25% error rate. To further evaluate this, I used a benchmark error rate - the rate at which one would blindly predict the cover type without the help of a model - which came up to 86%. 

![This is an image]()

![This is an image]()

1. Training accuracy rises as model complexity increases
2. Testing accuracy penalizes models that are too complex or not complex enough
3. For KNN models, complexity is determined by the value of K (lower value = more complex)

K=1 provides the best accuracy score. One reason for this may be that the data are fairly dense, at least for the non-dummy variable features. This makes it more likely that a close training data point can be found with a small k value.


<ins>*CART Model Construction:*</ins> 
After loading my dataset into R-Studio, I managed the dataset. Since Classification models predict based on categorical and numerical variables, the inputs have to be numerical and categorical e.g. hillshade, elevation, aspect, slope. Here, the target is to predict Forest Cover Type .

![This is an image]()

<ins>*CART Model Interpretation:*</ins> 

After standardizing the remaining numerical variables and converting the categorical variables into factor, setting seed to 1234, and partitioning my model on a 60-40 training-test split, I created my model After running the models, I create tree both before and after pruning/cut the tree with optimal value of parameter CP  to remove unnecessary nodes.

![This is an image]()

![This is an image]()

![This is an image]()

From it, we can infer that my model predicted 549 times when Forest Cover type 1 was and was actually the correct Forest Cover Type in the observations split of the testing dataset. On the flip side, we can infer that the number of times my model predicted forest cover type 7 as it was in the test split, was 819. 

<ins>*CART Performance Evaluation:*</ins> 
After running my model, I calculated the accuracy rate - how often my model predicted the cover type correctly. The CART model predicted a  77% accuracy rate and a 22% error rate. To further evaluate this, I used a benchmark error rate - the rate at which one would blindly predict the cover type without the help of a model - which came up to 86%. 

![This is an image]()

The accuracy of the model on the test data is better when the tree is pruned, which means that the pruned decision tree model generalizes well and is more suited. However, there are also other factors that can influence decision tree model creation, such as building a tree on an unbalanced class. These factors were not accounted for in this demonstration but it's very important for them to be examined during a live model formulation.

<ins>*Pros and Cons of the KNN and CART Model:*</ins> 

*KNN Model*
Pros:
1. KNN is easy to implement as it takes two parameters i.e k and distance function.
2. Since the KNN algorithm requires no training before making predictions, new data can be added seamlessly which will not impact the accuracy of the algorithm.


Cons:
1. One needs to do feature scaling (standardization and normalization) before applying KNN algorithm to any dataset. If not, KNN may generate wrong predictions.

*CART Model*
Pros: 
1. Trees can be displayed graphically and can be easily interpreted by non-experts.
2. Decision trees can easily handle qualitative (categorical) features without the need to create dummy variables.


Cons:
1. As the tree grows in size, it becomes prone to overfitting and requires pruning.
2. A small change in the data set can make tree structure unstable and cause variance. 

<ins>*Which model is better?*</ins>  
The KNN model brought down the error rate by 75% from the benchmark error as compared to the CART model accounting for an error rate by 77% from the benchmark error. Thus, it is observed that CART model is more accurate as compared to KNN model to predict the forest cover type on the test data available.


