#Test analysis of the I chart 
library(tidyverse)

#pick out chart
dfi <- data_list[["Spc_I"]]
#view chart to identify empty column 
View(dfi)
#delete empty column 
dfi <- dfi %>% select(-X__2)
#create I chart from data
i_chart<- qic(dfi$X__1,
    data      = dfi,
    chart     = 'i',
    show.grid = TRUE,
    title     = '(I chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')
#extract underlying data from chart 
i_chart_data<-i_chart$data


#save results for I chart
i_chart_results<- i_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(i_chart_results, path = "data-out/c_chart_results.csv")


#create I chart with moving ranges (MR)
i_chart_MR<-qic(dfi$`Range Data Points`,
    data      = dfi, 
    chart     = 'mr',
    show.grid = TRUE,
    title     = 'Age of the last 100 patients (MR chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')
#extract data from I chart with moving ranges
i_chart_MR_data<-i_chart_MR$data


#save results for I chart with moving ranges (MR)
i_chart_MR_results<- i_chart_MR_data %>% select(y.sum, cl, lcl, ucl) %>%
  rename(`Range Data Points`= y.sum, `Range Averages` = cl, `Range LCLs` = lcl, `Range UCLs` = ucl)

write_csv(i_chart_MR_results, path = "data-out/i_chart_MR_results.csv")
