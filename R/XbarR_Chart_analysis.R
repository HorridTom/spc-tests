#Test analysis of XbarR chart 

library(tidyverse)

dfXbarR <- data_list[["Spc_XbarR"]]
dfXbarR <- dfXbarR %>% select(-X__1)
#Load qicharts2
library(qicharts2)
dfXbarR$month<- 1:nrow(dfc)

test<-qic(month, AVG,
    data  = dfXbarR,
    chart = 'xbar',
    title = 'Average age (Xbar Chart)',
    ylab  = 'Years',
    xlab  = 'Month')
test2<-test$data
