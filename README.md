# KNN Vs Classification Tree Models
Comparing model performance for predicting forest cover types

Dataset: [(https://www.kaggle.com/c/forest-cover-type-prediction)]

<ins>*Introduction:*</ins>

In this paper, I build upon my [findings from the EDA process.](https://github.com/jackfrost68/EDA_of_the_Forest_Cover_Type_Dataset_Using_Tableau.git) First, I construct two separate models i.e. KNN and a Classification Tree to predict using my dataset. Thereafter, I implement different controlling strategies that prevent my models from being overfit/too complex. Lastly, I evaluate their performances, review the pros and cons of each model and then choose the most appropriate one for my dataset.

<ins>*KNN Model Construction:*</ins>

After loading my dataset into R-Studio, I managed the dataset. Since KNN models predict based on distance of variables, the inputs have to be numerical e.g. elevation, aspect, slope. Therefore, I dropped all other categorical variables e.g. ID, Wilderness_Area, Soil_Type, except the Hillshade and Cover_Type, which is my target (what I’m trying to predict).

![This is an image](https://github.com/jackfrost68/-Forest-Cover-Type-Analysis-Phase-1/blob/d40a70bcf8fac0f8ab0402a3aaac016c374ca56b/Forest%20Cover%20Type%20By%20Elevation%20Cleaned%202.png)
