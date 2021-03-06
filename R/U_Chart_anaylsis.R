
# pick out the U chart data 
dfu <- data_list[["Spc_U"]]

# delete empty column 
dfu <- dfu %>% select(-X__1)

# add column month 
dfu$month<- 1:nrow(dfu)

# create u chart 
u_chart<- qic(dfu$month, dfu$`Numerator (COUNT)`, dfu$`Denominator (SUM)`,
           data     = dfu,
           chart    = 'u',
           multiply = 1,
           title    = 'Patient harm (U chart)',
           ylab     = 'Adverse events per day',
           xlab     = 'Month')

# extract data from u chart
u_chart_data<- u_chart$data
u_chart

# save results for u chart
u_chart_results<- u_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(u_chart_results, path = "data-out/u_chart_results.csv")
