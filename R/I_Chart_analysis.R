#Test analysis of the I chart 
library(tidyverse)

#pick out chart
dfi <- data_list[["Spc_I"]]
#view chart to identify empty column 
View(dfi)
#delete empty column 
dfi <- dfi %>% select(-X__2)
#create I chart from data
testi<- qic(dfi$X__1,
    data      = dfi,
    chart     = 'i',
    show.grid = TRUE,
    title     = '(I chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')
#extract underlying data from chart 
test3<-testi$data
#create I chart with moving ranges
test3i<-qic(dfi$`Range Data Points`,
    data      = dfi, 
    chart     = 'mr',
    show.grid = TRUE,
    title     = 'Age of the last 100 patients (MR chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')
#extract data from I chart with moving ranges
test4<-test3i$data
