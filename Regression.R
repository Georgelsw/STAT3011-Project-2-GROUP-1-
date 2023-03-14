#Data Input
data<-read.csv("pizza&GDP.csv",encoding="UTF-8",row.names = 1)

#Select columns with information for regression and rearrange the order
data<-data[,c(1,21,4,16,15,22,23)]

#Drop duplicates
data<-data[!duplicated(data[c(1,5)]),]

#Add new columns which counts no. of certain types of pizza sold by res., no. of res. in the province, no. of pizza choices provided
pizza_type <- data$menus.name
pizza_count <- vector(mode="numeric")
for (i in 1:length(pizza_type)) {
  pizza_count <- c(pizza_count,length(which(pizza_type == pizza_type[i])))
}
data$pizza_count <- pizza_count
data<-data[,c(1:5,8,6,7)]

no_res_province <- data$GDP #GDP used here because we added GDP to the csv by matching the province to the state, so rows with same GDP are in the same province
res_count_province <- vector(mode="numeric")
for (i in 1:length(no_res_province)) {
  res_count_province <- c(res_count_province,length(which(no_res_province == no_res_province[i])))
}
data$res_count_province <- res_count_province
data<-data[,c(1,2,9,3:8)]

no_choice <- data$name
no_choices <- vector(mode="numeric")
for (i in 1:length(no_choice)) {
  no_choices <- c(no_choices,length(which(no_choice == no_choice[i])))
}
data$no_choices <- no_choices
data<-data[,c(1:5,10,6:9)]

#Remove unwanted columns
reg_df <- data[,c(3,6,8:10)]
#=====================================================================================================
#Variable explanation:
#res_count_province: no. of pizza res. in the province (representing the popularity of res. location)
#no_choices: no. of pizza flavors provided in that res. (representing the variety of flavor)
#pizza_count: no. of res. that selling that type of pizza (representing the popularity of flavor)
#average_price: average price on menu of that res. (representing the price of pizza)
#GDP: 2016 annual state GDP in millions (representing the profit of selling pizza)
#=====================================================================================================

#Model 1: What factors affect the profit of selling pizza?
#Check correlation of variables
pairs(reg_df)
cor(reg_df)
#correlation between predictors is not observed so multicollinearity problem, linear relationship can be observed between GDP and res_count_province

#Build the model
m11 <- lm(reg_df$GDP ~ reg_df$res_count_province + reg_df$no_choices + reg_df$pizza_count + reg_df$average_price)
summary(m11)
#reg_df$pizza_count is not significant, drop it
#Adjusted R-squared is 0.4026, which is low. Note that GDP has large value, so also consider log-transformation

