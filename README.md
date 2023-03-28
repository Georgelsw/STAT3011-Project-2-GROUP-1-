# STAT3011-Project-2
## Statistic project 2-Pizza Analysis 
This project is based on Chapter 27: Pizza Restaurant Data Analysis of Data Science, Analytics, and AI for Business and the Real World. By using the data csv provided in the reference book, we performed different data manipulation and analysis to solve different problems.  

For information of the data csv, visit (https://raw.githubusercontent.com/rajeevratan84/data-analyst-bootcamp/master/8358_1.csv).  

### Table of contents  
- Data Imputation 
- Data visualization  
- Regression  
- C.I. for price and P.I. for GDP  
- Decision Tree  

### 0. Data Imputation  
Person-in-charge: All  
Related Documents: 2016 US GDP.xlsx, Detect Outlier.ipynb, Imputation.ipynb, newpizzadata.csv, pizza&GDP.csv  
- Searched 2016 US GDP for Accommodation and Food Services as extra data  
- Missing data (use imputation to replace the Nah data and zero data)  
- Outlier (detect and delete outlier for smooth data visualisation,regreesion and data.map)  


### 1. Data visualization  
Problem: Where is the state and location of the pizza restaurant?  Which is the most popular pizza and the most prevalent average price for pizza?  
Person-in-charge: LI Shengwei, WONG Tuen Hung  
Related Documents: Data_visualisation.ipynb, Average_price.map.png, Numbers of restaurant.map.png, Restaurant location.map.png, wordcloud.ipynb
- Problems solution, improved code and extra graphs
- Pizza map (average price, restaurant location, restaurant counts)
- Word cloud (the most popular pizza in menus and the most average price for pizza by detect the texts in csv.file.) 

### 2. Regression  
Problem: What factors are affecting the pizza business?  
Person-in-charge: LUI Chak Sum, FAN Jingyi  
Related Documents: Regression.R, scatterplot.png, residual_plot.png, QQplot.png  
- Build model see what factors are significant for GDP (profit of selling pizza)  

### 3. C.I. for price and P.I. for GDP   
Problem: What range of the price we should set to maximize our profit?  
Person-in-charge: CHAU Ka Yan, CHEN Lu  
Related Documents: pizza_price_CI.2.0.ipynb, Confidence interval of pizza average price.png, CI of different pizza price.r, CI of different pizza price.png, Prediction interval of GDP.R.
- Calculate the C.I. of average/max. price of every types of pizza  
- Calculate the P.I. of GDP  

### 4. Decision Tree  
Problem: Find out the decision direction for defining the pizza price as expensive or not.  
Person-in-charge: LI Shengwei, WONG Tuen Hung  
Related Documents:  Decision Tree.R , Decision tree result.ipynb
- Classify the type of pizza as normal or expensive by factors such as maximum price, minimum price or GDP. 
- Train parts of data set then test remaining data to check the decision tree model accuracy.

### Contributing
LI Shengwei - https://github.com/Georgelsw  
WONG Tuen Hung - https://github.com/Tuenhung  
LUI Chak Sum - https://github.com/Funghi0705  
FAN Jingy - https://github.com/ChloeeFan  
CHAU Ka Yan - https://github.com/Zero1470  
CHEN Lu - https://github.com/chenlu-helen  
