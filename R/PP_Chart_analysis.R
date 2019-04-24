dfp <- data_list[["Spc_P"]]
dfp <- dfp %>% select(-X__1)
dfp$month<- 1:nrow(dfp) 
pp_chart<-qic(month, dfp$`Numerator (COUNT)`, dfp$`Denominator (COUNT)`,
    data      = dfp,
    chart     = 'pp',
    y.percent = TRUE,
    title     = 'Harmed patients (P chart)',
    ylab      = NULL,
    xlab      = 'Month')
pp_chart_data<-pp_chart$data


#save results 
pp_chart_results<- pp_chart_data %>% select(y, cl, lcl, ucl) %>%
  rename(`Process Data Points`= y, `Process Averages` = cl, `Process LCLs` = lcl, `Process UCLs` = ucl)

write_csv(pp_chart_results, path = "data-out/pp_chart_results.csv")


