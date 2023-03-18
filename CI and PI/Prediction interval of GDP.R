#Data Input
data<-read.csv("C:/Users/user/Desktop/pizza&GDP.csv",encoding="UTF-8",row.names = 1)
data$GDP <- as.numeric(data$GDP)

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

#Model built from previous result
m12 <- lm(I(log(reg_df$GDP)) ~ I(log(reg_df$res_count_province)) + I(log(reg_df$no_choices)) 
          + I(log(reg_df$average_price)))

# Using the previous result to calculate prediction interval.
# Create a prediction interval function.
PI <- function(conf_level, res_count_province, no_choices, average_price) {
  a = 1-conf_level/100
  n=nrow(log(reg_df))
  p=ncol(log(reg_df))-2
  #Note that from previous result, we built the model by log-trans
  # , so our PI should also based on log value too
  log_res_count_province=log(res_count_province)
  log_no_choices=log(no_choices)
  log_average_price=log(average_price)
  xstar = as.matrix(c(1,log_res_count_province, log_no_choices, log_average_price))
  bhat = as.matrix(m12$coefficients)
  ystar = t(xstar) %*% bhat
  sigmahat = (sum((m12$residuals)^2)/(n-p-1))^(1/2)
  X = cbind(1,as.matrix((log(reg_df))[,c(1,2,4)]))
  XTX_inverse = solve(t(X) %*% X)
  sepred = sigmahat*(1+ t(xstar) %*%  XTX_inverse %*% xstar)^(1/2)
  t_cri = abs(qt(a/2,n-p-1))
  #Find lower and upper bound of the PI for the log(GDP)
  lower = ystar - t_cri * sepred
  upper = ystar + t_cri * sepred
  #Transform the value to get PI for the GDP
  e_lower = exp(lower)
  e_upper = exp(upper)
  print(paste0("The ystar for GDP is (" , exp(ystar) ,")." ))
  print(paste0("The required ", conf_level ,"% PI for GDP is (" , e_lower , ", " , e_upper , ")." ))
}
#=====================================================================================================
#According to the Final model 1 conclusion in Regression : operating the restaurant in the province 
# with the largest number of pizza restaurants, limiting the flavors provided
# , and increasing the pizza price bring us more profit.

#Thus, the GDP prediction interval will be calculated in a profit maximizing situation. The upper limit
# of the confidence interval of number of pizza restaurant in the province, average price of pizza 
# and the the lower limit of the confidence interval of number of pizza flavors will be used.

#Confidence interval of average price of pizza is calculated in pizza_price_CI.2.0 which is [8.53, 14.18].

#Now we are going to calculate the confidence interval of number of pizza restaurant in the province
# and number of pizza flavors provided in restaurant.
#=====================================================================================================

# Create a confidence interval function.
CI <- function(conf_level, data) {
  CI_mean <- mean(data)
  CI_sd <- sd(data)
  CI_n = length(data)
  CI_df <- CI_n - 1
  CI_a = 1-conf_level/100
  CI_t_cri <- abs(qt(CI_a/2, CI_df))
  CI_moe <- CI_t_cri * (CI_sd / sqrt(CI_n))
  lower_ci <- CI_mean - CI_moe
  upper_ci <- CI_mean + CI_moe
  print(paste0("The required ", conf_level ,"% CI is (" , lower_ci , ", " , upper_ci , ")." ))
}
CI(95, reg_df$res_count_province)
#"The required 95% CI is (215.159572439137, 228.304777470989)."
CI(95, reg_df$no_choices)
#"The required 95% CI is (9.93991682985682, 10.7754816123241)."
#=====================================================================================================
#Find the 95% CI for GDP with res_count_province=228.304777470989, no_choices=9.93991682985682, average_price=14.18
PI(95,228.304777470989,9.93991682985682,14.18)
#"The required 95% PI for GDP is (33002.0917749055, 248066.122520752)."
#=====================================================================================================
