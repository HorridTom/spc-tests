#Test analysis of the C chart 
library(tidyverse)

#Pick out chart
dfc <- data_list[["Spc_C"]]
#delete the blank column 
dfc <- dfc %>% select(-X__1)

#Load qicharts2
library(qicharts2)
#create row 'month'
dfc$month<- 1:nrow(dfc) 
#Create C Chart from the data 
c_chart<- qic(dfc$month,dfc$`Process Data Points`,
    data  = dfc,
    chart = 'c',
    title = 'Hospital acquired Clostridium difficile infections (C chart)',
    ylab  = 'Count',
    xlab  = 'Month')
#Pull out data from the c chart (UCL, LCL, CL)
c_chart_data<- test$data
c_chart


#save results 
c_chart_results<- c_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(c_chart_results, path = "data-out/c_chart_results.csv")
