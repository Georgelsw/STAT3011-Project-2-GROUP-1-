install.packages("forestplot")
library(forestplot)
data <-read.csv("~/Downloads/3011/CI for average price/CI.csv")
txt <- data[,1]
hr <- data[,c(2:4)]
forestplot(txt,hr,
           ci.vertices = TRUE, 
           ci.vertices.height = 0.1, 
           graph.pos = 2,       
           graphwidth = unit(100,"mm"),  
           clip=c(-100,200),  
           xticks = c(0,5,10,15),    
           txt_gp = fpTxtGp(ticks = gpar(cex = 1),xlab = gpar(cex = 0.7),  cex = 0.7),   
           col=fpColors(box="black",line="black",summary="black"),   
           fn.ci_norm = fpDrawCircleCI,  
           boxsize = 0.02,  
           vertices = TRUE,  
           xlab="Confidence Intervel" ) 


