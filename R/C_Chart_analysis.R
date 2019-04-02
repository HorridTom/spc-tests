#Test analysis of the C chart 
library(tidyverse)

#Pick out chart
dfc <- data_list[["Spc_C"]]
#delete the blank column 
dfc <- dfc %>% select(-X__1)