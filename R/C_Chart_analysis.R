#Test analysis of the C chart 
library(tidyverse)

#Pick out chart
dfc <- data_list[["Spc_C"]]
#delete the blank column 
dfc <- dfc %>% select(-X__1)

#Load qicharts2
library(qicharts2)
#Create C Chart from the data 
test<- qic(dfc$month,dfc$`Process Data Points`,
    data  = dfc,
    chart = 'c',
    title = 'Hospital acquired Clostridium difficile infections (C chart)',
    ylab  = 'Count',
    xlab  = 'Month')
#Pull out data from the c chart (UCL, LCL, CL)
test2<- test$data
